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
 
import { describe, beforeAll, it, expect } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import { PixelMapUtil } from '../../../main/ets/model/utils/PixelMapUtil';

/**
 * PixelMapUtil 图案素材工具类设备侧测试
 * 覆盖：棋盘格/斜纹/圆点生成尺寸、RGBA_8888 格式、像素级颜色校验
 * （readPixelsToBuffer 字节序验证：R,G,B,A）
 */
export default function pixelMapUtilTest() {
  describe('pixelMapUtilTest', () => {
    const RED = 0xFF0000FF; // rgba(255,0,0,255)
    const BLUE = 0x0000FFFF; // rgba(0,0,255,255)

    beforeAll(() => {
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PIXELMAPUTIL_0100
     * @tc.name rgbaPacking001
     * @tc.desc Verify rgba packs channels into a 32-bit ARGB integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('rgba_packing', 0, () => {
      expect(PixelMapUtil.rgba(255, 0, 0, 255)).assertEqual(0xFF0000FF);
      expect(PixelMapUtil.rgba(0, 0, 255, 255)).assertEqual(0x0000FFFF);
      expect(PixelMapUtil.rgba(1, 2, 3, 4)).assertEqual(0x01020304);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PIXELMAPUTIL_0200
     * @tc.name checkerboardSize002
     * @tc.desc Verify checkerboard size and RGBA_8888 pixel format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('checkerboard_size', 0, () => {
      const pm = PixelMapUtil.createCheckerboard(4, 1, RED, BLUE);
      const info = pm.getImageInfoSync();
      expect(info.size.width).assertEqual(4);
      expect(info.size.height).assertEqual(4);
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PIXELMAPUTIL_0300
     * @tc.name checkerboardPixelColors003
     * @tc.desc Verify checkerboard pixel bytes alternate the A and B colours
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('checkerboard_pixelColors', 0, () => {
      // 4x4 棋盘格 cell=1：(0,0) 为 A 色（红），(1,0) 为 B 色（蓝）
      const pm = PixelMapUtil.createCheckerboard(4, 1, RED, BLUE);
      const buffer = new ArrayBuffer(4 * 4 * 4);
      pm.readPixelsToBufferSync(buffer);
      const bytes = new Uint8Array(buffer);
      // 像素(0,0)：R=255, G=0, B=0, A=255
      expect(bytes[0]).assertEqual(255);
      expect(bytes[1]).assertEqual(0);
      expect(bytes[2]).assertEqual(0);
      expect(bytes[3]).assertEqual(255);
      // 像素(1,0)：R=0, G=0, B=255, A=255
      expect(bytes[4]).assertEqual(0);
      expect(bytes[6]).assertEqual(255);
      expect(bytes[7]).assertEqual(255);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PIXELMAPUTIL_0400
     * @tc.name stripesSize004
     * @tc.desc Verify the stripes bitmap size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('stripes_size', 0, () => {
      const pm = PixelMapUtil.createStripes(8, 4, RED, BLUE);
      const info = pm.getImageInfoSync();
      expect(info.size.width).assertEqual(8);
      expect(info.size.height).assertEqual(8);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PIXELMAPUTIL_0500
     * @tc.name dotsCenterIsColorA005
     * @tc.desc Verify the dot centre pixel uses colour A
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dots_centerIsColorA', 0, () => {
      // 圆点阵中心像素应为 A 色
      const pm = PixelMapUtil.createDots(9, 2, RED, BLUE);
      const buffer = new ArrayBuffer(9 * 9 * 4);
      pm.readPixelsToBufferSync(buffer);
      const bytes = new Uint8Array(buffer);
      const centerIndex = (4 * 9 + 4) * 4;
      expect(bytes[centerIndex]).assertEqual(255); // R
      expect(bytes[centerIndex + 2]).assertEqual(0); // B
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PIXELMAPUTIL_0600
     * @tc.name dotsCornerIsColorB006
     * @tc.desc Verify the dot corner pixel uses colour B
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dots_cornerIsColorB', 0, () => {
      // 圆点阵角落像素应为 B 色
      const pm = PixelMapUtil.createDots(9, 2, RED, BLUE);
      const buffer = new ArrayBuffer(9 * 9 * 4);
      pm.readPixelsToBufferSync(buffer);
      const bytes = new Uint8Array(buffer);
      expect(bytes[0]).assertEqual(0); // R
      expect(bytes[2]).assertEqual(255); // B
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PIXELMAPUTIL_0700
     * @tc.name generateSizeAndPixels007
     * @tc.desc Verify the generator writes left-red and right-blue pixels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('generate_sizeAndPixels', 0, () => {
      // 通用像素生成器：左半红右半蓝
      const pm = PixelMapUtil.generate(4, (x: number, y: number): number => {
        return x < 2 ? RED : BLUE;
      }, 'test-half');
      const info = pm.getImageInfoSync();
      expect(info.size.width).assertEqual(4);
      expect(info.size.height).assertEqual(4);
      const buffer = new ArrayBuffer(4 * 4 * 4);
      pm.readPixelsToBufferSync(buffer);
      const bytes = new Uint8Array(buffer);
      // 像素(0,0) 红
      expect(bytes[0]).assertEqual(255);
      expect(bytes[2]).assertEqual(0);
      // 像素(2,0) 蓝
      expect(bytes[2 * 4]).assertEqual(0);
      expect(bytes[2 * 4 + 2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PIXELMAPUTIL_0800
     * @tc.name generateDiagonalGradient008
     * @tc.desc Verify the generator red channel grows with x
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('generate_diagonalGradient', 0, () => {
      // 对角渐变：R 通道随 x 线性递增
      const pm = PixelMapUtil.generate(4, (x: number, y: number): number => {
        return PixelMapUtil.rgba(x * 60, 0, 0, 255);
      }, 'test-grad');
      const buffer = new ArrayBuffer(4 * 4 * 4);
      pm.readPixelsToBufferSync(buffer);
      const bytes = new Uint8Array(buffer);
      expect(bytes[0]).assertEqual(0); // x=0
      expect(bytes[3 * 4]).assertEqual(180); // x=3 → 180
    });
  });
}
