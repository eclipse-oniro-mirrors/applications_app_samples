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
import { describe, it, expect } from '@ohos/hypium';
import { CanvasScenes } from '../../../main/ets/model/CanvasScenes';

/**
 * CanvasScenes 扩展场景矩阵套件
 * 在 CanvasScenes.test 基线之上补齐输入维度：
 * 极小 / 超宽 / 超高画布、同一上下文重复绘制、虚线数组复位、
 * 文字测量可用、裁剪区域像素、像素回读不透明。
 */

/** 六类扩展场景在指定上下文与尺寸下的统一调用（ArkTS 不允许嵌套函数，置于模块级） */
function drawExtendedScenes(ctx: CanvasRenderer, w: number, h: number): void {
  CanvasScenes.drawConicGradient(ctx, w, h);
  CanvasScenes.drawPathCurves(ctx, w, h);
  CanvasScenes.drawClipComposite(ctx, w, h);
  CanvasScenes.drawTextStyles(ctx, w, h);
  CanvasScenes.drawLineDash(ctx, w, h);
  CanvasScenes.drawImageDataReadback(ctx, w, h);
}

export default function canvasScenesMatrixTest() {
  describe('canvasScenesMatrixTest', () => {
    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_CANVASSENCESMATRIX_0100
     * @tc.name tinyCanvas40x200100
     * @tc.desc Verify all extended scenes draw on a 40x20 tiny canvas
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tinyCanvas_40x20', 0, () => {
      // 极小画布：半径、像素区域都会被夹到下限，验证不产生非法参数
      const off = new OffscreenCanvas(40, 20);
      const ctx = off.getContext('2d');
      drawExtendedScenes(ctx, 40, 20);
      const bmp = off.transferToImageBitmap();
      expect(bmp.width).assertEqual(40);
      expect(bmp.height).assertEqual(20);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_CANVASSENCESMATRIX_0200
     * @tc.name wideCanvas640x1800200
     * @tc.desc Verify all extended scenes draw on a 640x180 wide canvas
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('wideCanvas_640x180', 0, () => {
      const off = new OffscreenCanvas(640, 180);
      const ctx = off.getContext('2d');
      drawExtendedScenes(ctx, 640, 180);
      const bmp = off.transferToImageBitmap();
      expect(bmp.width).assertEqual(640);
      expect(bmp.height).assertEqual(180);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_CANVASSENCESMATRIX_0300
     * @tc.name tallCanvas120x4800300
     * @tc.desc Verify all extended scenes draw on a 120x480 tall canvas
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tallCanvas_120x480', 0, () => {
      const off = new OffscreenCanvas(120, 480);
      const ctx = off.getContext('2d');
      drawExtendedScenes(ctx, 120, 480);
      const bmp = off.transferToImageBitmap();
      expect(bmp.width).assertEqual(120);
      expect(bmp.height).assertEqual(480);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_CANVASSENCESMATRIX_0400
     * @tc.name repeatedRunsOnSameContext0400
     * @tc.desc Verify extended scenes can run three times on one context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('repeatedRuns_sameContext', 0, () => {
      // 同一上下文连续三轮绘制：状态复位不完整时此处会暴露
      const off = new OffscreenCanvas(200, 100);
      const ctx = off.getContext('2d');
      for (let round = 0; round < 3; round++) {
        drawExtendedScenes(ctx, 200, 100);
      }
      const bmp = off.transferToImageBitmap();
      expect(bmp.width).assertEqual(200);
      expect(bmp.height).assertEqual(100);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_CANVASSENCESMATRIX_0500
     * @tc.name lineDashArrayReset0500
     * @tc.desc Verify the dash array is empty after the stroke scene
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lineDash_arrayReset', 0, () => {
      const off = new OffscreenCanvas(200, 100);
      const ctx = off.getContext('2d');
      CanvasScenes.drawLineDash(ctx, 200, 100);
      expect(ctx.getLineDash().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_CANVASSENCESMATRIX_0600
     * @tc.name textMeasureUsableAfterScene0600
     * @tc.desc Verify text measurement still works after the text scene draws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('text_measureUsableAfterScene', 0, () => {
      // 文字状态为只写属性，绘制后通过 measureText 验证字号与状态可用
      const off = new OffscreenCanvas(200, 100);
      const ctx = off.getContext('2d');
      CanvasScenes.drawTextStyles(ctx, 200, 100);
      expect(ctx.measureText('Canvas').width > 0).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_CANVASSENCESMATRIX_0700
     * @tc.name clipRegionPixels0700
     * @tc.desc Verify clip keeps pixels inside the region and leaves outside transparent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('clip_regionPixels', 0, () => {
      // 圆形裁剪中心不透明；远离裁剪区的角落保持透明
      const off = new OffscreenCanvas(200, 100);
      const ctx = off.getContext('2d');
      CanvasScenes.drawClipComposite(ctx, 200, 100);
      const inside = ctx.getImageData(50, 25, 1, 1);
      expect(inside.data[3]).assertEqual(255);
      const outside = ctx.getImageData(180, 90, 1, 1);
      expect(outside.data[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_CANVASSENCESMATRIX_0800
     * @tc.name readbackCenterOpaque0800
     * @tc.desc Verify readback scene leaves the center region opaque at three sizes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('readback_centerOpaque', 0, () => {
      const sizes: number[][] = [[40, 20], [200, 100], [320, 240]];
      for (const size of sizes) {
        const w: number = size[0];
        const h: number = size[1];
        const off = new OffscreenCanvas(w, h);
        const ctx = off.getContext('2d');
        CanvasScenes.drawImageDataReadback(ctx, w, h);
        const pixel = ctx.getImageData(Math.floor(w / 2), Math.floor(h / 2), 1, 1);
        expect(pixel.data[3]).assertEqual(255);
      }
    });
  });
}
