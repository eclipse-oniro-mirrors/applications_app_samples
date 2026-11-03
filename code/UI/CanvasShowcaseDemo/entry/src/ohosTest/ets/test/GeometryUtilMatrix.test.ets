import { describe, beforeAll, it, expect } from '@ohos/hypium';
import { GeometryUtil, Point } from '../../../main/ets/model/utils/GeometryUtil';

/**
 * GeometryUtil 几何工具类矩阵套件
 * 在 GeometryUtil.test 基础上补齐角度/象限/边界矩阵：
 * 角度弧度已知值与负角、九角往返、圆周点偏移/零半径/负半径/整圈+四分之一/半径不变式、
 * 角度版负角与弧度版逐角一致、矩形四边与零尺寸/负坐标/外侧/近角点、clamp 负区间/退化区间、
 * 距离水平垂直/负坐标/对称/对角/大数值。
 */
export default function geometryUtilMatrixTest() {
  describe('geometryUtilMatrixTest', () => {
    const EPS = 1e-9;

    beforeAll(() => {
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_GEOMETRYUTILMATRIX_0100
     * @tc.name degToRadKnownAngles0100
     * @tc.desc Verify degToRad maps 0/90/180/360 to the known radian values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('degToRad_knownAngles', 0, () => {
      expect(GeometryUtil.degToRad(0)).assertEqual(0);
      expect(Math.abs(GeometryUtil.degToRad(90) - Math.PI / 2) < EPS).assertTrue();
      expect(Math.abs(GeometryUtil.degToRad(180) - Math.PI) < EPS).assertTrue();
      expect(Math.abs(GeometryUtil.degToRad(360) - 2 * Math.PI) < EPS).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_GEOMETRYUTILMATRIX_0200
     * @tc.name degToRadNegativeAngles0200
     * @tc.desc Verify negative degrees convert to negative radians
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('degToRad_negativeAngles', 0, () => {
      expect(Math.abs(GeometryUtil.degToRad(-90) + Math.PI / 2) < EPS).assertTrue();
      expect(Math.abs(GeometryUtil.degToRad(-180) + Math.PI) < EPS).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_GEOMETRYUTILMATRIX_0300
     * @tc.name radToDegKnownAngles0300
     * @tc.desc Verify radToDeg maps pi/2, pi and 2pi to 90/180/360
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('radToDeg_knownAngles', 0, () => {
      expect(GeometryUtil.radToDeg(0)).assertEqual(0);
      expect(Math.abs(GeometryUtil.radToDeg(Math.PI / 2) - 90) < EPS).assertTrue();
      expect(Math.abs(GeometryUtil.radToDeg(Math.PI) - 180) < EPS).assertTrue();
      expect(Math.abs(GeometryUtil.radToDeg(2 * Math.PI) - 360) < EPS).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_GEOMETRYUTILMATRIX_0400
     * @tc.name radToDegNegativeAngles0400
     * @tc.desc Verify negative radians convert to negative degrees
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('radToDeg_negativeAngles', 0, () => {
      expect(Math.abs(GeometryUtil.radToDeg(-Math.PI / 2) + 90) < EPS).assertTrue();
      expect(Math.abs(GeometryUtil.radToDeg(-Math.PI) + 180) < EPS).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_GEOMETRYUTILMATRIX_0500
     * @tc.name degRadRoundtripNineAngles0500
     * @tc.desc Verify degree-radian round-trips for nine spread angles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('degRad_roundtripNineAngles', 0, () => {
      const angles: number[] = [0, 30, 45, 60, 90, 120, 180, 270, 360];
      for (const deg of angles) {
        const back: number = GeometryUtil.radToDeg(GeometryUtil.degToRad(deg));
        expect(Math.abs(back - deg) < EPS).assertTrue();
      }
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_GEOMETRYUTILMATRIX_0600
     * @tc.name pointOnCircleFourQuadrantsOffset0600
     * @tc.desc Verify circle points around an offset centre hit all four quadrants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pointOnCircle_fourQuadrantsOffset', 0, () => {
      const p0: Point = GeometryUtil.pointOnCircle(10, 20, 5, 0);
      expect(Math.abs(p0.x - 15) < EPS).assertTrue();
      expect(Math.abs(p0.y - 20) < EPS).assertTrue();
      const p90: Point = GeometryUtil.pointOnCircle(10, 20, 5, Math.PI / 2);
      expect(Math.abs(p90.x - 10) < EPS).assertTrue();
      expect(Math.abs(p90.y - 25) < EPS).assertTrue();
      const p180: Point = GeometryUtil.pointOnCircle(10, 20, 5, Math.PI);
      expect(Math.abs(p180.x - 5) < EPS).assertTrue();
      const p270: Point = GeometryUtil.pointOnCircle(10, 20, 5, 1.5 * Math.PI);
      expect(Math.abs(p270.y - 15) < EPS).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_GEOMETRYUTILMATRIX_0700
     * @tc.name pointOnCircleZeroRadius0700
     * @tc.desc Verify a zero radius maps every angle to the centre
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pointOnCircle_zeroRadius', 0, () => {
      const a: Point = GeometryUtil.pointOnCircle(7, 9, 0, 0);
      expect(a.x).assertEqual(7);
      expect(a.y).assertEqual(9);
      const b: Point = GeometryUtil.pointOnCircle(7, 9, 0, Math.PI / 3);
      expect(Math.abs(b.x - 7) < EPS).assertTrue();
      expect(Math.abs(b.y - 9) < EPS).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_GEOMETRYUTILMATRIX_0800
     * @tc.name pointOnCircleNegativeRadius0800
     * @tc.desc Verify a negative radius flips the point to the opposite side
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pointOnCircle_negativeRadius', 0, () => {
      const p: Point = GeometryUtil.pointOnCircle(100, 100, -10, 0);
      expect(Math.abs(p.x - 90) < EPS).assertTrue();
      expect(Math.abs(p.y - 100) < EPS).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_GEOMETRYUTILMATRIX_0900
     * @tc.name pointOnCircleFullTurnPlusQuarter0900
     * @tc.desc Verify an angle beyond a full turn matches its principal angle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pointOnCircle_fullTurnPlusQuarter', 0, () => {
      const wrapped: Point = GeometryUtil.pointOnCircle(0, 0, 10, 2 * Math.PI + Math.PI / 2);
      expect(Math.abs(wrapped.x) < EPS).assertTrue();
      expect(Math.abs(wrapped.y - 10) < EPS).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_GEOMETRYUTILMATRIX_1000
     * @tc.name pointOnCircleAllPointsAtRadius1000
     * @tc.desc Verify every generated point stays exactly one radius from the centre
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pointOnCircle_allPointsAtRadius', 0, () => {
      const cx = 30;
      const cy = 40;
      const r = 25;
      const angles: number[] = [-Math.PI, -Math.PI / 2, 0, Math.PI / 4, Math.PI / 2, Math.PI, 1.5 * Math.PI];
      for (const angle of angles) {
        const p: Point = GeometryUtil.pointOnCircle(cx, cy, r, angle);
        const d: number = GeometryUtil.distance(cx, cy, p.x, p.y);
        expect(Math.abs(d - r) < EPS).assertTrue();
      }
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_GEOMETRYUTILMATRIX_1100
     * @tc.name pointOnCircleDeg180And2701100
     * @tc.desc Verify the degree overload lands at 180 and 270 degrees
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pointOnCircleDeg_180And270', 0, () => {
      const p180: Point = GeometryUtil.pointOnCircleDeg(100, 100, 50, 180);
      expect(Math.abs(p180.x - 50) < EPS).assertTrue();
      expect(Math.abs(p180.y - 100) < EPS).assertTrue();
      const p270: Point = GeometryUtil.pointOnCircleDeg(100, 100, 50, 270);
      expect(Math.abs(p270.x - 100) < EPS).assertTrue();
      expect(Math.abs(p270.y - 50) < EPS).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_GEOMETRYUTILMATRIX_1200
     * @tc.name pointOnCircleDegNegativeAngles1200
     * @tc.desc Verify negative degrees resolve to the mirrored screen positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pointOnCircleDeg_negativeAngles', 0, () => {
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 10, -90);
      expect(Math.abs(p.x) < EPS).assertTrue();
      expect(Math.abs(p.y + 10) < EPS).assertTrue();
      const q: Point = GeometryUtil.pointOnCircleDeg(0, 0, 10, -180);
      expect(Math.abs(q.x + 10) < EPS).assertTrue();
      expect(Math.abs(q.y) < EPS).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_GEOMETRYUTILMATRIX_1300
     * @tc.name pointOnCircleDegMatchesRadAngles1300
     * @tc.desc Verify degree and radian overloads agree at eight angles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pointOnCircleDeg_matchesRadAngles', 0, () => {
      const degrees: number[] = [0, 45, 90, 135, 180, 225, 270, 315];
      for (const deg of degrees) {
        const pDeg: Point = GeometryUtil.pointOnCircleDeg(20, 30, 12, deg);
        const pRad: Point = GeometryUtil.pointOnCircle(20, 30, 12, GeometryUtil.degToRad(deg));
        expect(Math.abs(pDeg.x - pRad.x) < EPS).assertTrue();
        expect(Math.abs(pDeg.y - pRad.y) < EPS).assertTrue();
      }
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_GEOMETRYUTILMATRIX_1400
     * @tc.name rectContainsLeftAndRightEdges1400
     * @tc.desc Verify points on the left and right edges are contained
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('rectContains_leftAndRightEdges', 0, () => {
      expect(GeometryUtil.rectContains(0, 0, 10, 10, 0, 5)).assertTrue();
      expect(GeometryUtil.rectContains(0, 0, 10, 10, 10, 5)).assertTrue();
      expect(GeometryUtil.rectContains(0, 0, 10, 10, -0.001, 5)).assertFalse();
      expect(GeometryUtil.rectContains(0, 0, 10, 10, 10.001, 5)).assertFalse();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_GEOMETRYUTILMATRIX_1500
     * @tc.name rectContainsTopAndBottomEdges1500
     * @tc.desc Verify points on the top and bottom edges are contained
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('rectContains_topAndBottomEdges', 0, () => {
      expect(GeometryUtil.rectContains(0, 0, 10, 10, 5, 0)).assertTrue();
      expect(GeometryUtil.rectContains(0, 0, 10, 10, 5, 10)).assertTrue();
      expect(GeometryUtil.rectContains(0, 0, 10, 10, 5, -0.001)).assertFalse();
      expect(GeometryUtil.rectContains(0, 0, 10, 10, 5, 10.001)).assertFalse();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_GEOMETRYUTILMATRIX_1600
     * @tc.name rectContainsZeroSizeRect1600
     * @tc.desc Verify a zero-size rectangle contains only its origin point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('rectContains_zeroSizeRect', 0, () => {
      expect(GeometryUtil.rectContains(5, 5, 0, 0, 5, 5)).assertTrue();
      expect(GeometryUtil.rectContains(5, 5, 0, 0, 5.001, 5)).assertFalse();
      expect(GeometryUtil.rectContains(5, 5, 0, 0, 4.999, 5)).assertFalse();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_GEOMETRYUTILMATRIX_1700
     * @tc.name rectContainsNegativeOriginRect1700
     * @tc.desc Verify containment works for a rectangle positioned in negative space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('rectContains_negativeOriginRect', 0, () => {
      // 矩形 (-10,-10) 尺寸 5 → 覆盖 [-10,-5]×[-10,-5]
      expect(GeometryUtil.rectContains(-10, -10, 5, 5, -7, -7)).assertTrue();
      expect(GeometryUtil.rectContains(-10, -10, 5, 5, -5, -5)).assertTrue();
      expect(GeometryUtil.rectContains(-10, -10, 5, 5, -4.9, -7)).assertFalse();
      expect(GeometryUtil.rectContains(-10, -10, 5, 5, -7, -4.9)).assertFalse();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_GEOMETRYUTILMATRIX_1800
     * @tc.name rectContainsOutsideEachEdge1800
     * @tc.desc Verify points just outside each of the four edges are excluded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('rectContains_outsideEachEdge', 0, () => {
      expect(GeometryUtil.rectContains(0, 0, 10, 10, -1, 5)).assertFalse();
      expect(GeometryUtil.rectContains(0, 0, 10, 10, 11, 5)).assertFalse();
      expect(GeometryUtil.rectContains(0, 0, 10, 10, 5, -1)).assertFalse();
      expect(GeometryUtil.rectContains(0, 0, 10, 10, 5, 11)).assertFalse();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_GEOMETRYUTILMATRIX_1900
     * @tc.name rectContainsInsideFarCorner1900
     * @tc.desc Verify a point just inside the far corner is contained
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('rectContains_insideFarCorner', 0, () => {
      expect(GeometryUtil.rectContains(0, 0, 10, 10, 9.999, 9.999)).assertTrue();
      expect(GeometryUtil.rectContains(0, 0, 10, 10, 10.001, 9.999)).assertFalse();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_GEOMETRYUTILMATRIX_2000
     * @tc.name clampNegativeRange2000
     * @tc.desc Verify clamp works for a range entirely below zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('clamp_negativeRange', 0, () => {
      expect(GeometryUtil.clamp(-5, -10, 0)).assertEqual(-5);
      expect(GeometryUtil.clamp(-15, -10, 0)).assertEqual(-10);
      expect(GeometryUtil.clamp(5, -10, 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_GEOMETRYUTILMATRIX_2100
     * @tc.name clampDegenerateRange2100
     * @tc.desc Verify a degenerate min=max range collapses every value to that bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('clamp_degenerateRange', 0, () => {
      expect(GeometryUtil.clamp(5, 5, 5)).assertEqual(5);
      expect(GeometryUtil.clamp(4, 5, 5)).assertEqual(5);
      expect(GeometryUtil.clamp(6, 5, 5)).assertEqual(5);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_GEOMETRYUTILMATRIX_2200
     * @tc.name distanceHorizontalAndVertical2200
     * @tc.desc Verify axis-aligned distances equal the coordinate difference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('distance_horizontalAndVertical', 0, () => {
      expect(GeometryUtil.distance(0, 0, 0, 7)).assertEqual(7);
      expect(GeometryUtil.distance(0, 0, 9, 0)).assertEqual(9);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_GEOMETRYUTILMATRIX_2300
     * @tc.name distanceNegativeCoordinates2300
     * @tc.desc Verify distance handles points in negative coordinate space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('distance_negativeCoordinates', 0, () => {
      expect(GeometryUtil.distance(-3, -4, 0, 0)).assertEqual(5);
      expect(GeometryUtil.distance(-3, -4, -6, -8)).assertEqual(5);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_GEOMETRYUTILMATRIX_2400
     * @tc.name distanceSymmetric2400
     * @tc.desc Verify swapping the two points yields the same distance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('distance_symmetric', 0, () => {
      const d1: number = GeometryUtil.distance(1, 2, 4, 6);
      const d2: number = GeometryUtil.distance(4, 6, 1, 2);
      expect(d1).assertEqual(5);
      expect(d2).assertEqual(5);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_GEOMETRYUTILMATRIX_2500
     * @tc.name distanceUnitDiagonal2500
     * @tc.desc Verify the unit diagonal distance is the square root of two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('distance_unitDiagonal', 0, () => {
      expect(Math.abs(GeometryUtil.distance(0, 0, 1, 1) - Math.SQRT2) < EPS).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_GEOMETRYUTILMATRIX_2600
     * @tc.name distanceLargeScale2600
     * @tc.desc Verify a 3000-4000-5000 right triangle distance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('distance_largeScale', 0, () => {
      expect(GeometryUtil.distance(0, 0, 3000, 4000)).assertEqual(5000);
    });
  });
}
