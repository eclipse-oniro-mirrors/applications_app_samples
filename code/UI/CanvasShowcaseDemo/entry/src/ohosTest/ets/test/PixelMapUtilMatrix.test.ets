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
 * PixelMapUtil 图案素材工具类矩阵套件
 * 在 PixelMapUtil.test 基础上补齐像素级图案矩阵：
 * 棋盘格 cell=2 分块/奇数尺寸奇偶性/alpha 保留/1x1、斜纹对角等值/period=2/自定义颜色、
 * 圆点半径边界/零半径/覆盖全图/偶数尺寸中心、generate 行主序坐标/像素回读、
 * rgba 高位掩码/零值全值、create 非正方形尺寸/行主序映射/RGBA_8888 格式/alpha 往返。
 */

const RED = 0xFF0000FF; // rgba(255,0,0,255)
const GREEN = 0x00FF00FF; // rgba(0,255,0,255)
const BLUE = 0x0000FFFF; // rgba(0,0,255,255)
const BLACK = 0x000000FF; // rgba(0,0,0,255)
const WHITE = 0xFFFFFFFF; // rgba(255,255,255,255)

/** 读取整幅位图为 R,G,B,A 字节序 */
function readBytes(pm: image.PixelMap, width: number, height: number): Uint8Array {
  const buffer: ArrayBuffer = new ArrayBuffer(width * height * 4);
  pm.readPixelsToBufferSync(buffer);
  return new Uint8Array(buffer);
}

/** 像素 (x,y) 在字节流中的起始下标 */
function pixelIndex(x: number, y: number, width: number): number {
  return (y * width + x) * 4;
}

export default function pixelMapUtilMatrixTest() {
  describe('pixelMapUtilMatrixTest', () => {
    beforeAll(() => {
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PIXELMAPUTILMATRIX_0100
     * @tc.name checkerboardCell2Blocks0100
     * @tc.desc Verify a 2px checkerboard alternates blocks in both axes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('checkerboard_cell2Blocks', 0, () => {
      const pm = PixelMapUtil.createCheckerboard(6, 2, RED, BLUE);
      const b: Uint8Array = readBytes(pm, 6, 6);
      // (0,0) A 红
      expect(b[pixelIndex(0, 0, 6)]).assertEqual(255);
      expect(b[pixelIndex(0, 0, 6) + 2]).assertEqual(0);
      // (2,0) B 蓝
      expect(b[pixelIndex(2, 0, 6)]).assertEqual(0);
      expect(b[pixelIndex(2, 0, 6) + 2]).assertEqual(255);
      // (2,2) A 红（同行列奇偶相同）
      expect(b[pixelIndex(2, 2, 6)]).assertEqual(255);
      // (0,2) B 蓝
      expect(b[pixelIndex(0, 2, 6) + 2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PIXELMAPUTILMATRIX_0200
     * @tc.name checkerboardParityOddSize0200
     * @tc.desc Verify the checkerboard parity rule on an odd-sized bitmap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('checkerboard_parityOddSize', 0, () => {
      const pm = PixelMapUtil.createCheckerboard(5, 1, RED, BLUE);
      const b: Uint8Array = readBytes(pm, 5, 5);
      // 同奇偶 (1,1) A，(0,1) B
      expect(b[pixelIndex(1, 1, 5)]).assertEqual(255);
      expect(b[pixelIndex(0, 1, 5)]).assertEqual(0);
      expect(b[pixelIndex(0, 1, 5) + 2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PIXELMAPUTILMATRIX_0300
     * @tc.name checkerboardAlphaPreserved0300
     * @tc.desc Verify a translucent A colour keeps its alpha byte in the bitmap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('checkerboard_alphaPreserved', 0, () => {
      const translucentA = PixelMapUtil.rgba(255, 0, 0, 128);
      const pm = PixelMapUtil.createCheckerboard(4, 1, translucentA, BLUE);
      const b: Uint8Array = readBytes(pm, 4, 4);
      expect(b[pixelIndex(0, 0, 4) + 3]).assertEqual(128);
      expect(b[pixelIndex(1, 0, 4) + 3]).assertEqual(255);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PIXELMAPUTILMATRIX_0400
     * @tc.name checkerboardSize1_0400
     * @tc.desc Verify a 1x1 checkerboard holds a single A pixel
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('checkerboard_size1', 0, () => {
      const pm = PixelMapUtil.createCheckerboard(1, 1, RED, BLUE);
      const info = pm.getImageInfoSync();
      expect(info.size.width).assertEqual(1);
      expect(info.size.height).assertEqual(1);
      const b: Uint8Array = readBytes(pm, 1, 1);
      expect(b[0]).assertEqual(255);
      expect(b[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PIXELMAPUTILMATRIX_0500
     * @tc.name stripesDiagonalConstantSum0500
     * @tc.desc Verify stripes colour depends on floor((x+y)/period) parity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('stripes_diagonalConstantSum', 0, () => {
      const pm = PixelMapUtil.createStripes(8, 4, RED, BLUE);
      const b: Uint8Array = readBytes(pm, 8, 8);
      // x+y=0/3 落在第 0 带（A），x+y=4 无论坐标如何都落在第 1 带（B）
      expect(b[pixelIndex(0, 0, 8)]).assertEqual(255);
      expect(b[pixelIndex(2, 1, 8)]).assertEqual(255);
      expect(b[pixelIndex(3, 1, 8)]).assertEqual(0);
      expect(b[pixelIndex(4, 0, 8)]).assertEqual(0);
      expect(b[pixelIndex(3, 1, 8) + 2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PIXELMAPUTILMATRIX_0600
     * @tc.name stripesPeriodTwo0600
     * @tc.desc Verify stripes with period 2 repeat every two diagonal bands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('stripes_periodTwo', 0, () => {
      const pm = PixelMapUtil.createStripes(8, 2, RED, BLUE);
      const b: Uint8Array = readBytes(pm, 8, 8);
      // (0,0)→带0 A，(2,0)→带1 B，(4,0)→带2 A，(0,2)→带1 B
      expect(b[pixelIndex(0, 0, 8)]).assertEqual(255);
      expect(b[pixelIndex(2, 0, 8)]).assertEqual(0);
      expect(b[pixelIndex(4, 0, 8)]).assertEqual(255);
      expect(b[pixelIndex(0, 2, 8)]).assertEqual(0);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PIXELMAPUTILMATRIX_0700
     * @tc.name stripesCustomColors0700
     * @tc.desc Verify stripes honour caller-supplied colours
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('stripes_customColors', 0, () => {
      const pm = PixelMapUtil.createStripes(4, 2, GREEN, BLACK);
      const b: Uint8Array = readBytes(pm, 4, 4);
      // (0,0) 绿：R=0 G=255
      expect(b[pixelIndex(0, 0, 4)]).assertEqual(0);
      expect(b[pixelIndex(0, 0, 4) + 1]).assertEqual(255);
      // (2,0) 黑：全 0，alpha 255
      expect(b[pixelIndex(2, 0, 4)]).assertEqual(0);
      expect(b[pixelIndex(2, 0, 4) + 1]).assertEqual(0);
      expect(b[pixelIndex(2, 0, 4) + 3]).assertEqual(255);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PIXELMAPUTILMATRIX_0800
     * @tc.name dotsRadiusBoundary0800
     * @tc.desc Verify a pixel exactly on the radius is inside the dot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dots_radiusBoundary', 0, () => {
      const pm = PixelMapUtil.createDots(9, 2, RED, BLUE);
      const b: Uint8Array = readBytes(pm, 9, 9);
      // 圆心 (4,4)；(4,2) 距离恰为 2 → A；(4,1) 距离 3 → B
      expect(b[pixelIndex(4, 2, 9)]).assertEqual(255);
      expect(b[pixelIndex(4, 1, 9)]).assertEqual(0);
      expect(b[pixelIndex(4, 1, 9) + 2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PIXELMAPUTILMATRIX_0900
     * @tc.name dotsRadiusZeroOnlyCenter0900
     * @tc.desc Verify radius 0 fills only the centre pixel
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dots_radiusZeroOnlyCenter', 0, () => {
      const pm = PixelMapUtil.createDots(5, 0, RED, BLUE);
      const b: Uint8Array = readBytes(pm, 5, 5);
      expect(b[pixelIndex(2, 2, 5)]).assertEqual(255);
      expect(b[pixelIndex(2, 1, 5)]).assertEqual(0);
      expect(b[pixelIndex(0, 0, 5)]).assertEqual(0);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PIXELMAPUTILMATRIX_1000
     * @tc.name dotsRadiusCoversAll1000
     * @tc.desc Verify a radius beyond half the size fills the whole bitmap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dots_radiusCoversAll', 0, () => {
      const pm = PixelMapUtil.createDots(9, 10, RED, BLUE);
      const b: Uint8Array = readBytes(pm, 9, 9);
      expect(b[pixelIndex(0, 0, 9)]).assertEqual(255);
      expect(b[pixelIndex(8, 8, 9)]).assertEqual(255);
      expect(b[pixelIndex(0, 8, 9)]).assertEqual(255);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PIXELMAPUTILMATRIX_1100
     * @tc.name dotsEvenSizeCenter1100
     * @tc.desc Verify the dot centre lands between pixels for an even size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dots_evenSizeCenter', 0, () => {
      const pm = PixelMapUtil.createDots(8, 2, RED, BLUE);
      const b: Uint8Array = readBytes(pm, 8, 8);
      // 圆心 (3.5,3.5)：(3,3) 与 (3,5) 在半径内，(0,0) 在外
      expect(b[pixelIndex(3, 3, 8)]).assertEqual(255);
      expect(b[pixelIndex(3, 5, 8)]).assertEqual(255);
      expect(b[pixelIndex(0, 0, 8)]).assertEqual(0);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PIXELMAPUTILMATRIX_1200
     * @tc.name generateReceivesRowMajorCoordinates1200
     * @tc.desc Verify generate passes (x,y) in row-major order exactly once per pixel
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('generate_receivesRowMajorCoordinates', 0, () => {
      const xs: number[] = [];
      const ys: number[] = [];
      const pm = PixelMapUtil.generate(3, (x: number, y: number): number => {
        xs.push(x);
        ys.push(y);
        return RED;
      }, 'coords');
      const info = pm.getImageInfoSync();
      expect(info.size.width).assertEqual(3);
      expect(xs.length).assertEqual(9);
      expect(xs[0]).assertEqual(0);
      expect(xs[1]).assertEqual(1);
      expect(xs[2]).assertEqual(2);
      expect(ys[0]).assertEqual(0);
      expect(xs[3]).assertEqual(0);
      expect(ys[3]).assertEqual(1);
      expect(xs[8]).assertEqual(2);
      expect(ys[8]).assertEqual(2);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PIXELMAPUTILMATRIX_1300
     * @tc.name generatePixelValueRoundtrip1300
     * @tc.desc Verify generated pixel values reach the bitmap at the matching coordinates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('generate_pixelValueRoundtrip', 0, () => {
      const pm = PixelMapUtil.generate(3, (x: number, y: number): number => {
        return PixelMapUtil.rgba(x * 80, y * 80, 0, 255);
      }, 'grad');
      const b: Uint8Array = readBytes(pm, 3, 3);
      expect(b[pixelIndex(1, 0, 3)]).assertEqual(80);
      expect(b[pixelIndex(1, 0, 3) + 1]).assertEqual(0);
      expect(b[pixelIndex(2, 2, 3)]).assertEqual(160);
      expect(b[pixelIndex(2, 2, 3) + 1]).assertEqual(160);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PIXELMAPUTILMATRIX_1400
     * @tc.name rgbaMasksHighBits1400
     * @tc.desc Verify rgba masks out-of-range channel values to their low byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('rgba_masksHighBits', 0, () => {
      // 300→44，-1→255，0x1FF→255
      expect(PixelMapUtil.rgba(300, -1, 0x1FF, 0)).assertEqual(0x2CFFFF00);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PIXELMAPUTILMATRIX_1500
     * @tc.name rgbaZeroAndOpaque1500
     * @tc.desc Verify rgba packs transparent and opaque white extremes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('rgba_zeroAndOpaque', 0, () => {
      expect(PixelMapUtil.rgba(0, 0, 0, 0)).assertEqual(0);
      expect(PixelMapUtil.rgba(255, 255, 255, 255)).assertEqual(0xFFFFFFFF);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PIXELMAPUTILMATRIX_1600
     * @tc.name createNonSquareDimensions1600
     * @tc.desc Verify create supports a non-square width/height pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('create_nonSquareDimensions', 0, () => {
      const colors: number[] = [RED, GREEN, BLUE, BLACK, WHITE, 0x123456FF];
      const pm = PixelMapUtil.create(3, 2, colors, 'rect');
      const info = pm.getImageInfoSync();
      expect(info.size.width).assertEqual(3);
      expect(info.size.height).assertEqual(2);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PIXELMAPUTILMATRIX_1700
     * @tc.name createRowMajorMapping1700
     * @tc.desc Verify the colour list maps to pixels in row-major order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('create_rowMajorMapping', 0, () => {
      const colors: number[] = [RED, GREEN, BLUE, BLACK, WHITE, 0x123456FF];
      const pm = PixelMapUtil.create(3, 2, colors, 'rect');
      const b: Uint8Array = readBytes(pm, 3, 2);
      // (0,1) 是第 4 个颜色（黑）
      expect(b[pixelIndex(0, 1, 3)]).assertEqual(0);
      expect(b[pixelIndex(0, 1, 3) + 3]).assertEqual(255);
      // (2,1) 是第 6 个颜色 0x123456FF
      expect(b[pixelIndex(2, 1, 3)]).assertEqual(0x12);
      expect(b[pixelIndex(2, 1, 3) + 1]).assertEqual(0x34);
      expect(b[pixelIndex(2, 1, 3) + 2]).assertEqual(0x56);
      expect(b[pixelIndex(2, 1, 3) + 3]).assertEqual(255);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PIXELMAPUTILMATRIX_1800
     * @tc.name createPixelFormatRgba88881800
     * @tc.desc Verify stripes, dots and generated bitmaps all use RGBA_8888
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('create_pixelFormatRgba8888', 0, () => {
      const stripes = PixelMapUtil.createStripes(4, 2, RED, BLUE);
      const dots = PixelMapUtil.createDots(4, 1, RED, BLUE);
      const gen = PixelMapUtil.generate(4, (x: number, y: number): number => RED, 'fmt');
      expect(stripes.getImageInfoSync().pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(dots.getImageInfoSync().pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(gen.getImageInfoSync().pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PIXELMAPUTILMATRIX_1900
     * @tc.name createAlphaChannelRoundtrip1900
     * @tc.desc Verify zero and partial alpha values survive the byte round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('create_alphaChannelRoundtrip', 0, () => {
      const colors: number[] = [PixelMapUtil.rgba(0, 0, 0, 0), PixelMapUtil.rgba(0, 0, 0, 127)];
      const pm = PixelMapUtil.create(2, 1, colors, 'alpha');
      const b: Uint8Array = readBytes(pm, 2, 1);
      expect(b[3]).assertEqual(0);
      expect(b[7]).assertEqual(127);
    });
  });
}
