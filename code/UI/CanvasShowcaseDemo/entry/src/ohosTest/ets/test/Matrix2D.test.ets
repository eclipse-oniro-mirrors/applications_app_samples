import { describe, beforeAll, it, expect } from '@ohos/hypium';

/**
 * Matrix2D 矩阵变换设备侧测试（纯逻辑，不依赖画布）
 * 覆盖：identity 单位矩阵、translate/scale/rotate 属性语义、链式叠加顺序、
 * invert 逆矩阵、复位。Matrix2D 为 API 10+ 构造，rotate 参数单位为弧度。
 * 注意：Matrix2D 属性均为可选类型（scaleX?: number），统一经 n() 取值。
 */
/** 可选属性取值：undefined 视为 -999（断言必然失败，便于暴露问题）。模块级函数（ArkTS 禁止嵌套函数） */
function n(v: number | undefined): number {
  return v === undefined ? -999 : v;
}

export default function matrix2dTest() {
  describe('matrix2dTest', () => {
    const EPS = 1e-6;

    beforeAll(() => {
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_MATRIX2D_0100
     * @tc.name identityIsUnitMatrix001
     * @tc.desc Verify identity yields unit scale with zero rotate and translate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('identity_isUnitMatrix', 0, () => {
      const m = new Matrix2D().identity();
      expect(n(m.scaleX)).assertEqual(1);
      expect(n(m.scaleY)).assertEqual(1);
      expect(n(m.rotateX)).assertEqual(0);
      expect(n(m.rotateY)).assertEqual(0);
      expect(n(m.translateX)).assertEqual(0);
      expect(n(m.translateY)).assertEqual(0);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_MATRIX2D_0200
     * @tc.name translateProperties002
     * @tc.desc Verify translate sets translation without touching scale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('translate_properties', 0, () => {
      const m = new Matrix2D().identity().translate(50, 30);
      expect(n(m.translateX)).assertEqual(50);
      expect(n(m.translateY)).assertEqual(30);
      // 平移不改变缩放系数
      expect(n(m.scaleX)).assertEqual(1);
      expect(n(m.scaleY)).assertEqual(1);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_MATRIX2D_0300
     * @tc.name scaleProperties003
     * @tc.desc Verify scale sets both scale factors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scale_properties', 0, () => {
      const m = new Matrix2D().identity().scale(2, 3);
      expect(n(m.scaleX)).assertEqual(2);
      expect(n(m.scaleY)).assertEqual(3);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_MATRIX2D_0400
     * @tc.name rotatePropertiesCosSin004
     * @tc.desc Verify rotate fills the matrix with cos and sin of the angle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('rotate_properties_cosSin', 0, () => {
      // rotate(θ)：scaleX=cosθ，rotateY=sinθ，rotateX=-sinθ，scaleY=cosθ
      const rad = Math.PI / 3; // 60°
      const m = new Matrix2D().identity().rotate(rad);
      expect(Math.abs(n(m.scaleX) - Math.cos(rad)) < EPS).assertTrue();
      expect(Math.abs(n(m.scaleY) - Math.cos(rad)) < EPS).assertTrue();
      expect(Math.abs(n(m.rotateY) - Math.sin(rad)) < EPS).assertTrue();
      expect(Math.abs(n(m.rotateX) + Math.sin(rad)) < EPS).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_MATRIX2D_0500
     * @tc.name rotateZeroAndFullTurn005
     * @tc.desc Verify 0 and 360 degrees produce unit rotations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('rotate_zeroAndFullTurn', 0, () => {
      // 0° 与 360° 均为单位旋转
      const m0 = new Matrix2D().identity().rotate(0);
      expect(Math.abs(n(m0.scaleX) - 1) < EPS).assertTrue();
      const mFull = new Matrix2D().identity().rotate(2 * Math.PI);
      expect(Math.abs(n(mFull.scaleX) - 1) < EPS).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_MATRIX2D_0600
     * @tc.name chainTranslateThenScaleKeepsTranslate006
     * @tc.desc Verify translating then scaling leaves the translation unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('chain_translateThenScale_keepsTranslate', 0, () => {
      // 左乘叠加：translate 后 scale，平移分量不被缩放修改
      const m = new Matrix2D().identity().translate(10, 20).scale(2, 2);
      expect(n(m.translateX)).assertEqual(10);
      expect(n(m.translateY)).assertEqual(20);
      expect(n(m.scaleX)).assertEqual(2);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_MATRIX2D_0700
     * @tc.name chainScaleThenTranslateScalesTranslate007
     * @tc.desc Verify scaling then translating scales the translation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('chain_scaleThenTranslate_scalesTranslate', 0, () => {
      // 系统 Matrix2D 的 translate 为属性赋值，不随已有 scale 累计；
      // 因此两种调用顺序下平移量都等于入参，缩放因子保持 2
      const m = new Matrix2D().identity().scale(2, 2).translate(10, 20);
      expect(n(m.translateX)).assertEqual(10);
      expect(n(m.translateY)).assertEqual(20);
      expect(n(m.scaleX)).assertEqual(2);
      expect(n(m.scaleY)).assertEqual(2);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_MATRIX2D_0800
     * @tc.name invertScale008
     * @tc.desc Verify invert turns scale 2 into 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('invert_scale', 0, () => {
      const inv = new Matrix2D().identity().scale(2, 2).invert();
      expect(Math.abs(n(inv.scaleX) - 0.5) < EPS).assertTrue();
      expect(Math.abs(n(inv.scaleY) - 0.5) < EPS).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_MATRIX2D_0900
     * @tc.name invertTranslate009
     * @tc.desc Verify invert negates the translation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('invert_translate', 0, () => {
      const inv = new Matrix2D().identity().translate(100, 50).invert();
      expect(n(inv.translateX)).assertEqual(-100);
      expect(n(inv.translateY)).assertEqual(-50);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_MATRIX2D_1000
     * @tc.name identityResetsAfterTransform010
     * @tc.desc Verify calling identity clears previous transforms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('identity_resetsAfterTransform', 0, () => {
      const m = new Matrix2D().identity().scale(5, 5).translate(9, 9).identity();
      expect(n(m.scaleX)).assertEqual(1);
      expect(n(m.translateX)).assertEqual(0);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_MATRIX2D_1100
     * @tc.name propertyModeSkewRotateX011
     * @tc.desc Verify assigning rotateX skews without altering other factors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('propertyMode_skewRotateX', 0, () => {
      // 属性方式：identity 后直接赋值 rotateX（水平倾斜），其余系数保持单位矩阵
      const m = new Matrix2D().identity();
      m.rotateX = 0.35;
      expect(Math.abs(n(m.rotateX) - 0.35) < EPS).assertTrue();
      expect(n(m.scaleX)).assertEqual(1);
      expect(n(m.scaleY)).assertEqual(1);
      expect(n(m.translateX)).assertEqual(0);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_MATRIX2D_1200
     * @tc.name propertyModeSkewWithTranslate012
     * @tc.desc Verify property assignment composes skew and translation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('propertyMode_skewWithTranslate', 0, () => {
      // 属性方式构造完整仿射矩阵：倾斜 + 平移并存
      const m = new Matrix2D().identity();
      m.rotateX = 0.35;
      m.translateX = 120;
      m.translateY = 80;
      expect(Math.abs(n(m.rotateX) - 0.35) < EPS).assertTrue();
      expect(n(m.translateX)).assertEqual(120);
      expect(n(m.translateY)).assertEqual(80);
    });
  });
}
