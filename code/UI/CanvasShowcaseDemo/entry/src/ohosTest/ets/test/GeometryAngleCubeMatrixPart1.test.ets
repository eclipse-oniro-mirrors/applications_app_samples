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

export default function GeometryAngleCubeMatrixPart1Test(): void {
  describe('GeometryAngleCubeMatrixPart1', () => {

    /**
     * @tc.number    SUB_CANVAS_GACP1_0100
     * @tc.name      testAnglePoint0001
     * @tc.desc      Verify point at angle 15 on circle (0, 0) r=10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0001 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 10, 15);
      expect(Math.abs(p.x - 9.659258262890683) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 2.5881904510252074) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0001 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_0200
     * @tc.name      testAnglePoint0002
     * @tc.desc      Verify point at angle 45 on circle (0, 0) r=10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0002 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 10, 45);
      expect(Math.abs(p.x - 7.0710678118654755) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 7.0710678118654755) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0002 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_0300
     * @tc.name      testAnglePoint0003
     * @tc.desc      Verify point at angle 75 on circle (0, 0) r=10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0003 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 10, 75);
      expect(Math.abs(p.x - 2.5881904510252074) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 9.659258262890683) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0003 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_0400
     * @tc.name      testAnglePoint0004
     * @tc.desc      Verify point at angle 105 on circle (0, 0) r=10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0004 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 10, 105);
      expect(Math.abs(p.x - -2.5881904510252083) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 9.659258262890683) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0004 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_0500
     * @tc.name      testAnglePoint0005
     * @tc.desc      Verify point at angle 135 on circle (0, 0) r=10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0005 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 10, 135);
      expect(Math.abs(p.x - -7.071067811865475) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 7.0710678118654755) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0005 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_0600
     * @tc.name      testAnglePoint0006
     * @tc.desc      Verify point at angle 165 on circle (0, 0) r=10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0006 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 10, 165);
      expect(Math.abs(p.x - -9.659258262890681) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 2.58819045102521) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0006 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_0700
     * @tc.name      testAnglePoint0007
     * @tc.desc      Verify point at angle 195 on circle (0, 0) r=10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0007 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 10, 195);
      expect(Math.abs(p.x - -9.659258262890685) < 1e-9).assertTrue();
      expect(Math.abs(p.y - -2.5881904510252034) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0007 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_0800
     * @tc.name      testAnglePoint0008
     * @tc.desc      Verify point at angle 225 on circle (0, 0) r=10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0008 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 10, 225);
      expect(Math.abs(p.x - -7.071067811865477) < 1e-9).assertTrue();
      expect(Math.abs(p.y - -7.071067811865475) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0008 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_0900
     * @tc.name      testAnglePoint0009
     * @tc.desc      Verify point at angle 255 on circle (0, 0) r=10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0009 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 10, 255);
      expect(Math.abs(p.x - -2.5881904510252065) < 1e-9).assertTrue();
      expect(Math.abs(p.y - -9.659258262890683) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0009 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_1000
     * @tc.name      testAnglePoint0010
     * @tc.desc      Verify point at angle 285 on circle (0, 0) r=10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0010 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 10, 285);
      expect(Math.abs(p.x - 2.5881904510252114) < 1e-9).assertTrue();
      expect(Math.abs(p.y - -9.659258262890681) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0010 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_1100
     * @tc.name      testAnglePoint0011
     * @tc.desc      Verify point at angle 315 on circle (0, 0) r=10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0011 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 10, 315);
      expect(Math.abs(p.x - 7.071067811865474) < 1e-9).assertTrue();
      expect(Math.abs(p.y - -7.071067811865477) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0011 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_1200
     * @tc.name      testAnglePoint0012
     * @tc.desc      Verify point at angle 345 on circle (0, 0) r=10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0012 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 10, 345);
      expect(Math.abs(p.x - 9.659258262890683) < 1e-9).assertTrue();
      expect(Math.abs(p.y - -2.588190451025207) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0012 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_1300
     * @tc.name      testAnglePoint0013
     * @tc.desc      Verify point at angle 15 on circle (0, 0) r=25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0013 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 25, 15);
      expect(Math.abs(p.x - 24.148145657226706) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 6.4704761275630185) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0013 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_1400
     * @tc.name      testAnglePoint0014
     * @tc.desc      Verify point at angle 45 on circle (0, 0) r=25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0014 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 25, 45);
      expect(Math.abs(p.x - 17.67766952966369) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 17.67766952966369) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0014 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_1500
     * @tc.name      testAnglePoint0015
     * @tc.desc      Verify point at angle 75 on circle (0, 0) r=25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0015 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 25, 75);
      expect(Math.abs(p.x - 6.4704761275630185) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 24.148145657226706) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0015 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_1600
     * @tc.name      testAnglePoint0016
     * @tc.desc      Verify point at angle 105 on circle (0, 0) r=25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0016 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 25, 105);
      expect(Math.abs(p.x - -6.470476127563021) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 24.148145657226706) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0016 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_1700
     * @tc.name      testAnglePoint0017
     * @tc.desc      Verify point at angle 135 on circle (0, 0) r=25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0017 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 25, 135);
      expect(Math.abs(p.x - -17.677669529663685) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 17.67766952966369) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0017 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_1800
     * @tc.name      testAnglePoint0018
     * @tc.desc      Verify point at angle 165 on circle (0, 0) r=25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0018 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 25, 165);
      expect(Math.abs(p.x - -24.148145657226706) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 6.470476127563026) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0018 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_1900
     * @tc.name      testAnglePoint0019
     * @tc.desc      Verify point at angle 195 on circle (0, 0) r=25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0019 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 25, 195);
      expect(Math.abs(p.x - -24.14814565722671) < 1e-9).assertTrue();
      expect(Math.abs(p.y - -6.470476127563009) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0019 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_2000
     * @tc.name      testAnglePoint0020
     * @tc.desc      Verify point at angle 225 on circle (0, 0) r=25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0020 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 25, 225);
      expect(Math.abs(p.x - -17.677669529663692) < 1e-9).assertTrue();
      expect(Math.abs(p.y - -17.677669529663685) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0020 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_2100
     * @tc.name      testAnglePoint0021
     * @tc.desc      Verify point at angle 255 on circle (0, 0) r=25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0021 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 25, 255);
      expect(Math.abs(p.x - -6.470476127563016) < 1e-9).assertTrue();
      expect(Math.abs(p.y - -24.148145657226706) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0021 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_2200
     * @tc.name      testAnglePoint0022
     * @tc.desc      Verify point at angle 285 on circle (0, 0) r=25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0022 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 25, 285);
      expect(Math.abs(p.x - 6.470476127563028) < 1e-9).assertTrue();
      expect(Math.abs(p.y - -24.148145657226706) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0022 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_2300
     * @tc.name      testAnglePoint0023
     * @tc.desc      Verify point at angle 315 on circle (0, 0) r=25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0023 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 25, 315);
      expect(Math.abs(p.x - 17.677669529663685) < 1e-9).assertTrue();
      expect(Math.abs(p.y - -17.677669529663692) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0023 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_2400
     * @tc.name      testAnglePoint0024
     * @tc.desc      Verify point at angle 345 on circle (0, 0) r=25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0024 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 25, 345);
      expect(Math.abs(p.x - 24.148145657226706) < 1e-9).assertTrue();
      expect(Math.abs(p.y - -6.470476127563017) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0024 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_2500
     * @tc.name      testAnglePoint0025
     * @tc.desc      Verify point at angle 15 on circle (100, 50) r=10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0025 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 50, 10, 15);
      expect(Math.abs(p.x - 109.65925826289069) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 52.588190451025206) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0025 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_2600
     * @tc.name      testAnglePoint0026
     * @tc.desc      Verify point at angle 45 on circle (100, 50) r=10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0026 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 50, 10, 45);
      expect(Math.abs(p.x - 107.07106781186548) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 57.071067811865476) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0026 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_2700
     * @tc.name      testAnglePoint0027
     * @tc.desc      Verify point at angle 75 on circle (100, 50) r=10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0027 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 50, 10, 75);
      expect(Math.abs(p.x - 102.58819045102521) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 59.65925826289068) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0027 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_2800
     * @tc.name      testAnglePoint0028
     * @tc.desc      Verify point at angle 105 on circle (100, 50) r=10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0028 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 50, 10, 105);
      expect(Math.abs(p.x - 97.41180954897479) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 59.65925826289068) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0028 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_2900
     * @tc.name      testAnglePoint0029
     * @tc.desc      Verify point at angle 135 on circle (100, 50) r=10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0029 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 50, 10, 135);
      expect(Math.abs(p.x - 92.92893218813452) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 57.071067811865476) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0029 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_3000
     * @tc.name      testAnglePoint0030
     * @tc.desc      Verify point at angle 165 on circle (100, 50) r=10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0030 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 50, 10, 165);
      expect(Math.abs(p.x - 90.34074173710931) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 52.58819045102521) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0030 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_3100
     * @tc.name      testAnglePoint0031
     * @tc.desc      Verify point at angle 195 on circle (100, 50) r=10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0031 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 50, 10, 195);
      expect(Math.abs(p.x - 90.34074173710931) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 47.411809548974794) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0031 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_3200
     * @tc.name      testAnglePoint0032
     * @tc.desc      Verify point at angle 225 on circle (100, 50) r=10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0032 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 50, 10, 225);
      expect(Math.abs(p.x - 92.92893218813452) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 42.928932188134524) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0032 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_3300
     * @tc.name      testAnglePoint0033
     * @tc.desc      Verify point at angle 255 on circle (100, 50) r=10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0033 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 50, 10, 255);
      expect(Math.abs(p.x - 97.41180954897479) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 40.34074173710932) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0033 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_3400
     * @tc.name      testAnglePoint0034
     * @tc.desc      Verify point at angle 285 on circle (100, 50) r=10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0034 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 50, 10, 285);
      expect(Math.abs(p.x - 102.58819045102521) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 40.34074173710932) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0034 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_3500
     * @tc.name      testAnglePoint0035
     * @tc.desc      Verify point at angle 315 on circle (100, 50) r=10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0035 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 50, 10, 315);
      expect(Math.abs(p.x - 107.07106781186548) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 42.928932188134524) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0035 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_3600
     * @tc.name      testAnglePoint0036
     * @tc.desc      Verify point at angle 345 on circle (100, 50) r=10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0036 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 50, 10, 345);
      expect(Math.abs(p.x - 109.65925826289069) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 47.411809548974794) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0036 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_3700
     * @tc.name      testAnglePoint0037
     * @tc.desc      Verify point at angle 15 on circle (100, 50) r=25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0037 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 50, 25, 15);
      expect(Math.abs(p.x - 124.1481456572267) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 56.47047612756302) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0037 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_3800
     * @tc.name      testAnglePoint0038
     * @tc.desc      Verify point at angle 45 on circle (100, 50) r=25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0038 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 50, 25, 45);
      expect(Math.abs(p.x - 117.67766952966369) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 67.67766952966369) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0038 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_3900
     * @tc.name      testAnglePoint0039
     * @tc.desc      Verify point at angle 75 on circle (100, 50) r=25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0039 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 50, 25, 75);
      expect(Math.abs(p.x - 106.47047612756302) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 74.1481456572267) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0039 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GACP1_4000
     * @tc.name      testAnglePoint0040
     * @tc.desc      Verify point at angle 105 on circle (100, 50) r=25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAnglePoint0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0040 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 50, 25, 105);
      expect(Math.abs(p.x - 93.52952387243698) < 1e-9).assertTrue();
      expect(Math.abs(p.y - 74.1481456572267) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAnglePoint0040 end');
    })

  })
}
