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
 
import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { GeometryUtil, Point } from '../../../main/ets/model/utils/GeometryUtil';

/**
 * GeometryUtil 几何工具类设备侧测试
 * 覆盖：角度弧度互转（往返）、圆周点四象限、矩形包含（内/外/边界）、
 * clamp、两点距离。
 */
export default function geometryUtilTest() {
  describe('geometryUtilTest', () => {
    const EPS = 1e-9;

    beforeAll(() => {
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_GEOMETRYUTIL_0100
     * @tc.name degRadRoundtrip001
     * @tc.desc Verify degree to radian conversion round-trips exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('degRad_roundtrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(GeometryUtil.degToRad(180)).assertEqual(Math.PI);
      expect(GeometryUtil.degToRad(90)).assertEqual(Math.PI / 2);
      expect(GeometryUtil.radToDeg(Math.PI)).assertEqual(180);
      // 往返允许浮点误差，精度要求 1e-9 度
      const roundtrip: number = GeometryUtil.radToDeg(GeometryUtil.degToRad(37.5));
      expect(Math.abs(roundtrip - 37.5) < EPS).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_GEOMETRYUTIL_0200
     * @tc.name pointOnCircleQuadrants002
     * @tc.desc Verify circle points land in all four quadrants with screen y-down
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pointOnCircle_quadrants', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      // 0° → (cx+r, cy)；90° → (cx, cy+r)（屏幕坐标系 y 向下顺时针）
      const p0: Point = GeometryUtil.pointOnCircle(100, 100, 50, 0);
      expect(Math.abs(p0.x - 150) < EPS).assertTrue();
      expect(Math.abs(p0.y - 100) < EPS).assertTrue();

      const p90: Point = GeometryUtil.pointOnCircle(100, 100, 50, Math.PI / 2);
      expect(Math.abs(p90.x - 100) < EPS).assertTrue();
      expect(Math.abs(p90.y - 150) < EPS).assertTrue();

      const p180: Point = GeometryUtil.pointOnCircle(100, 100, 50, Math.PI);
      expect(Math.abs(p180.x - 50) < EPS).assertTrue();

      const p270: Point = GeometryUtil.pointOnCircle(100, 100, 50, Math.PI * 1.5);
      expect(Math.abs(p270.y - 50) < EPS).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_GEOMETRYUTIL_0300
     * @tc.name pointOnCircleDegMatchesRad003
     * @tc.desc Verify the degree and radian overloads produce identical points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pointOnCircleDeg_matchesRad', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const pDeg: Point = GeometryUtil.pointOnCircleDeg(0, 0, 10, 60);
      const pRad: Point = GeometryUtil.pointOnCircle(0, 0, 10, Math.PI / 3);
      expect(Math.abs(pDeg.x - pRad.x) < EPS).assertTrue();
      expect(Math.abs(pDeg.y - pRad.y) < EPS).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_GEOMETRYUTIL_0400
     * @tc.name rectContains004
     * @tc.desc Verify rectContains covers inside, outside and boundary points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('rectContains', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      // 内部/外部/边界
      expect(GeometryUtil.rectContains(0, 0, 10, 10, 5, 5)).assertTrue();
      expect(GeometryUtil.rectContains(0, 0, 10, 10, 15, 5)).assertFalse();
      expect(GeometryUtil.rectContains(0, 0, 10, 10, 5, 15)).assertFalse();
      expect(GeometryUtil.rectContains(0, 0, 10, 10, 0, 0)).assertTrue();
      expect(GeometryUtil.rectContains(0, 0, 10, 10, 10, 10)).assertTrue();
      expect(GeometryUtil.rectContains(0, 0, 10, 10, -1, 5)).assertFalse();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_GEOMETRYUTIL_0500
     * @tc.name clamp005
     * @tc.desc Verify clamp keeps values inside and bounds values outside the range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('clamp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(GeometryUtil.clamp(5, 0, 10)).assertEqual(5);
      expect(GeometryUtil.clamp(-5, 0, 10)).assertEqual(0);
      expect(GeometryUtil.clamp(15, 0, 10)).assertEqual(10);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_GEOMETRYUTIL_0600
     * @tc.name distance006
     * @tc.desc Verify euclidean distance for a 3-4-5 triangle and identical points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('distance', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(GeometryUtil.distance(0, 0, 3, 4)).assertEqual(5);
      expect(GeometryUtil.distance(1, 1, 1, 1)).assertEqual(0);
    });
  });
}
