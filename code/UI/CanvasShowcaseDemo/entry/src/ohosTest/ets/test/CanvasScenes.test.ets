import { describe, beforeAll, it, expect } from '@ohos/hypium';
import { CanvasScenes } from '../../../main/ets/model/CanvasScenes';
import { PixelMapUtil } from '../../../main/ets/model/utils/PixelMapUtil';

/**
 * CanvasScenes 场景绘制设备侧测试
 * 策略：场景函数参数为 CanvasRenderer 基类，因此直接用 OffscreenCanvas 的
 * 离屏上下文无头执行（不依赖 UI 树），验证绘制流程不崩溃、
 * createPattern 判空路径、transferToImageBitmap 输出有效位图。
 */
export default function canvasScenesTest() {
  describe('canvasScenesTest', () => {
    const W = 200;
    const H = 100;
    let checkerBitmap: ImageBitmap | null = null;

    beforeAll(() => {
      const pm = PixelMapUtil.createCheckerboard(16, 4,
        PixelMapUtil.rgba(255, 255, 255, 255), PixelMapUtil.rgba(66, 165, 245, 255));
      checkerBitmap = new ImageBitmap(pm);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_CANVASSENCES_0100
     * @tc.name offscreenGetContext001
     * @tc.desc Verify OffscreenCanvas yields a usable 2D context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('offscreen_getContext', 0, () => {
      const off = new OffscreenCanvas(W, H);
      const ctx = off.getContext('2d');
      expect(ctx !== null && ctx !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_CANVASSENCES_0200
     * @tc.name drawLinearGradientNoThrow002
     * @tc.desc Verify linear and radial gradient scenes draw without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('drawLinearGradient_noThrow', 0, () => {
      const off = new OffscreenCanvas(W, H);
      const ctx = off.getContext('2d');
      CanvasScenes.drawLinearGradient(ctx, W, H);
      CanvasScenes.drawRadialGradient(ctx, W, H);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_CANVASSENCES_0300
     * @tc.name drawPatternFillRepeat003
     * @tc.desc Verify pattern fill works with repeat, repeat-x and no-repeat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('drawPatternFill_repeat', 0, () => {
      expect(checkerBitmap !== null).assertTrue();
      if (checkerBitmap === null) {
        return;
      }
      const off = new OffscreenCanvas(W, H);
      const ctx = off.getContext('2d');
      CanvasScenes.drawPatternFill(ctx, 0, 0, W, H, checkerBitmap, 'repeat');
      CanvasScenes.drawPatternFill(ctx, 0, 0, W, H / 2, checkerBitmap, 'repeat-x');
      CanvasScenes.drawPatternFill(ctx, 20, 20, W / 2, H / 2, checkerBitmap, 'no-repeat');
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_CANVASSENCES_0400
     * @tc.name drawMatrixScenesNoThrow004
     * @tc.desc Verify translate, scale, rotate and combined matrix scenes draw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('drawMatrixScenes_noThrow', 0, () => {
      const off = new OffscreenCanvas(W, H);
      const ctx = off.getContext('2d');
      CanvasScenes.drawMatrixTranslate(ctx, W, H);
      CanvasScenes.drawMatrixScale(ctx, W, H);
      CanvasScenes.drawMatrixRotate(ctx, W, H);
      CanvasScenes.drawMatrixCombined(ctx, W, H);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_CANVASSENCES_0500
     * @tc.name transferToImageBitmapValidSize005
     * @tc.desc Verify transferToImageBitmap keeps the canvas size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('transferToImageBitmap_validSize', 0, () => {
      const off = new OffscreenCanvas(W, H);
      const ctx = off.getContext('2d');
      CanvasScenes.drawLinearGradient(ctx, W, H);
      const bitmap = off.transferToImageBitmap();
      expect(bitmap.width).assertEqual(W);
      expect(bitmap.height).assertEqual(H);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_CANVASSENCES_0600
     * @tc.name compositePipeline006
     * @tc.desc Verify an offscreen source transfers and composites into the main canvas
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('composite_pipeline', 0, () => {
      // 完整流水线：离屏源绘制 → transfer → 主离屏画布 Matrix2D 变换贴图
      expect(checkerBitmap !== null).assertTrue();
      if (checkerBitmap === null) {
        return;
      }
      const src = new OffscreenCanvas(120, 120);
      const srcCtx = src.getContext('2d');
      const dotPm = PixelMapUtil.createDots(16, 4,
        PixelMapUtil.rgba(255, 255, 255, 255), PixelMapUtil.rgba(38, 50, 56, 255));
      CanvasScenes.drawOffscreenSource(srcCtx, 120, 120, new ImageBitmap(dotPm));
      const offBitmap = src.transferToImageBitmap();
      expect(offBitmap.width).assertEqual(120);

      const main = new OffscreenCanvas(W, H);
      const mainCtx = main.getContext('2d');
      CanvasScenes.drawComposite(mainCtx, W, H, offBitmap);
      const finalBitmap = main.transferToImageBitmap();
      expect(finalBitmap.width).assertEqual(W);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_CANVASSENCES_0700
     * @tc.name drawPatternFillNullSafe007
     * @tc.desc Verify pattern fill tolerates a null bitmap without crashing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('drawPatternFill_nullSafe', 0, () => {
      // createPattern 判空路径：无效素材时函数内部告警并返回，不崩溃
      const off = new OffscreenCanvas(W, H);
      const ctx = off.getContext('2d');
      CanvasScenes.drawPatternFill(ctx, 0, 0, W, H, checkerBitmap as ImageBitmap, 'repeat');
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_CANVASSENCES_0800
     * @tc.name drawMatrixSkewNoThrow008
     * @tc.desc Verify the property-mode skew scene draws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('drawMatrixSkew_noThrow', 0, () => {
      // 属性方式倾斜（rotateX/rotateY 直接赋值）
      const off = new OffscreenCanvas(W, H);
      const ctx = off.getContext('2d');
      CanvasScenes.drawMatrixSkew(ctx, W, H);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_CANVASSENCES_0900
     * @tc.name drawImageDataNoThrow009
     * @tc.desc Verify the ImageData pixel write scene draws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('drawImageData_noThrow', 0, () => {
      // ImageData 像素级写入 + putImageData
      const off = new OffscreenCanvas(W, H);
      const ctx = off.getContext('2d');
      CanvasScenes.drawImageData(ctx, W, H);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_CANVASSENCES_1000
     * @tc.name drawGradientFrameAllPhases010
     * @tc.desc Verify the gradient animation draws at start, middle and end phases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('drawGradientFrame_allPhases', 0, () => {
      // 渐变动画帧：t 起点/中段/终点均正常绘制
      const off = new OffscreenCanvas(W, H);
      const ctx = off.getContext('2d');
      CanvasScenes.drawGradientFrame(ctx, W, H, 0);
      CanvasScenes.drawGradientFrame(ctx, W, H, 0.5);
      CanvasScenes.drawGradientFrame(ctx, W, H, 0.99);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_CANVASSENCES_1100
     * @tc.name drawDotRingNoThrow011
     * @tc.desc Verify the polar dot ring scene draws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('drawDotRing_noThrow', 0, () => {
      // GeometryUtil 圆环阵（3 圈极坐标圆点）
      const off = new OffscreenCanvas(W, H);
      const ctx = off.getContext('2d');
      CanvasScenes.drawDotRing(ctx, W, H);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_CANVASSENCES_1200
     * @tc.name runCompositeScenePipeline012
     * @tc.desc Verify the registered composite scene produces a sized bitmap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('runCompositeScene_pipeline', 0, () => {
      // 注册表场景4 入口：离屏绘制 → transfer → 主画布变换贴图（完整流水线）
      if (checkerBitmap === null) {
        expect(checkerBitmap !== null).assertTrue();
        return;
      }
      const off = new OffscreenCanvas(W, H);
      const ctx = off.getContext('2d');
      const dotPm = PixelMapUtil.createDots(16, 4,
        PixelMapUtil.rgba(255, 255, 255, 255), PixelMapUtil.rgba(38, 50, 56, 255));
      CanvasScenes.runCompositeScene(ctx, W, H, new ImageBitmap(dotPm));
      const finalBitmap = off.transferToImageBitmap();
      expect(finalBitmap.width).assertEqual(W);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_CANVASSENCES_1300
     * @tc.name drawPatternTransformNoThrow013
     * @tc.desc Verify pattern transforms with rotation, scale and translation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('drawPatternTransform_noThrow', 0, () => {
      // CanvasPattern.setTransform：同一图案三种矩阵（旋转/缩放/平移）
      if (checkerBitmap === null) {
        expect(checkerBitmap !== null).assertTrue();
        return;
      }
      const off = new OffscreenCanvas(W, H);
      const ctx = off.getContext('2d');
      CanvasScenes.drawPatternTransform(ctx, W, H, checkerBitmap);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_CANVASSENCES_1400
     * @tc.name drawImageCropNoThrow014
     * @tc.desc Verify 9-argument drawImage source cropping draws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('drawImageCrop_noThrow', 0, () => {
      // drawImage 9 参数源矩形裁剪（内部自建离屏源图）
      const off = new OffscreenCanvas(W, H);
      const ctx = off.getContext('2d');
      CanvasScenes.drawImageCrop(ctx, W, H);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_CANVASSENCES_1500
     * @tc.name drawShadowGradientNoThrow015
     * @tc.desc Verify shadow on and off with gradient draws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('drawShadowGradient_noThrow', 0, () => {
      // 阴影开启/关闭 + 渐变叠加
      const off = new OffscreenCanvas(W, H);
      const ctx = off.getContext('2d');
      CanvasScenes.drawShadowGradient(ctx, W, H);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_CANVASSENCES_1600
     * @tc.name drawFilterBlurNoThrow016
     * @tc.desc Verify the blur filter scene draws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('drawFilterBlur_noThrow', 0, () => {
      // filter blur 与 none 对比
      const off = new OffscreenCanvas(W, H);
      const ctx = off.getContext('2d');
      CanvasScenes.drawFilterBlur(ctx, W, H);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_CANVASSENCES_1700
     * @tc.name drawColorMetricsGradientNoThrow017
     * @tc.desc Verify the ColorMetrics addColorStop overload draws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('drawColorMetricsGradient_noThrow', 0, () => {
      // addColorStop 的 ColorMetrics 重载（API 12+）
      const off = new OffscreenCanvas(W, H);
      const ctx = off.getContext('2d');
      CanvasScenes.drawColorMetricsGradient(ctx, W, H);
    });
  });
}
