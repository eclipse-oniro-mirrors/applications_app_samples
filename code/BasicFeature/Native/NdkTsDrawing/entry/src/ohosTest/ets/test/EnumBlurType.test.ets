/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, expect, it } from '@ohos/hypium';
import { drawing } from '@kit.ArkGraphics2D';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { createOffscreenTarget, OffscreenTarget } from '../../../main/ets/drawing/DrawingCanvasFactory';
import { rgba } from '../../../main/ets/drawing/DrawingTypes';
import { countInkedPixels, DRAWING_TAG, readPixelBuffer, runCase } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;
const SIZE: number = 200;
const AREA: number = SIZE * SIZE;
const LEFT: number = 60;
const TOP: number = 60;
const RIGHT: number = 140;
const BOTTOM: number = 140;
const CENTER_X: number = 100;
const CENTER_Y: number = 100;
const SIGMA: number = 6;

/**
 * Read one color channel of a pixel in a square RGBA_8888 buffer.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } x - Horizontal coordinate.
 * @param { number } y - Vertical coordinate.
 * @param { number } channel - 0 red, 1 green, 2 blue, 3 alpha.
 * @returns { number } Channel value of the pixel.
 */
function channelAt(buffer: ArrayBuffer, x: number, y: number, channel: number): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  return bytes[(y * SIZE + x) * 4 + channel];
}

/**
 * Read the alpha channel of one pixel.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } x - Horizontal coordinate.
 * @param { number } y - Vertical coordinate.
 * @returns { number } Alpha value.
 */
function alphaAt(buffer: ArrayBuffer, x: number, y: number): number {
  return channelAt(buffer, x, y, 3);
}

/**
 * Read the largest alpha value of a buffer.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Largest alpha value.
 */
function maxAlpha(buffer: ArrayBuffer): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  let largest: number = 0;
  for (let index: number = 3; index < bytes.length; index += 4) {
    if (bytes[index] > largest) {
      largest = bytes[index];
    }
  }
  return largest;
}

/**
 * Count the pixels carrying a partial alpha, which only a blurred edge creates.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Number of pixels with a value between 1 and 254.
 */
function partialAlpha(buffer: ArrayBuffer): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  let count: number = 0;
  for (let index: number = 3; index < bytes.length; index += 4) {
    if (bytes[index] > 0 && bytes[index] < 255) {
      count++;
    }
  }
  return count;
}

/**
 * Count painted pixels inside a rectangle of the bitmap.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } left - Left edge, inclusive.
 * @param { number } top - Top edge, inclusive.
 * @param { number } right - Right edge, exclusive.
 * @param { number } bottom - Bottom edge, exclusive.
 * @returns { number } Number of painted pixels.
 */
function inkBox(buffer: ArrayBuffer, left: number, top: number, right: number, bottom: number): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  let count: number = 0;
  for (let y: number = top; y < bottom; y++) {
    for (let x: number = left; x < right; x++) {
      if (bytes[(y * SIZE + x) * 4 + 3] > 0) {
        count++;
      }
    }
  }
  return count;
}

/**
 * Count the bytes that differ between two equally sized buffers.
 *
 * @param { ArrayBuffer } first - First buffer.
 * @param { ArrayBuffer } second - Second buffer.
 * @returns { number } Number of differing bytes.
 */
function diffCount(first: ArrayBuffer, second: ArrayBuffer): number {
  const left: Uint8Array = new Uint8Array(first);
  const right: Uint8Array = new Uint8Array(second);
  const length: number = Math.min(left.length, right.length);
  let count: number = 0;
  for (let index: number = 0; index < length; index++) {
    if (left[index] !== right[index]) {
      count++;
    }
  }
  return count;
}

/**
 * Count the painted pixels of the band above the source rectangle, which only a
 * blurred outer edge can reach.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Number of painted pixels in the outer band.
 */
function outerInk(buffer: ArrayBuffer): number {
  return inkBox(buffer, 20, 20, 180, TOP);
}

/**
 * Count the painted pixels of the square in the middle of the source rectangle.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Number of painted pixels in the inner square.
 */
function innerInk(buffer: ArrayBuffer): number {
  return inkBox(buffer, 80, 80, 120, 120);
}

/**
 * Build an opaque brush without any mask filter.
 *
 * @returns { drawing.Brush } Configured brush.
 */
function plainBrush(): drawing.Brush {
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(255, 20, 60, 200));
  brush.setAntiAlias(false);
  return brush;
}

/**
 * Build an opaque brush carrying a blur mask filter of one type.
 *
 * @param { drawing.BlurType } type - Blur style.
 * @param { number } sigma - Gaussian sigma, must be positive.
 * @returns { drawing.Brush } Configured brush.
 */
function maskedBrush(type: drawing.BlurType, sigma: number): drawing.Brush {
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(255, 20, 60, 200));
  brush.setAntiAlias(false);
  brush.setMaskFilter(drawing.MaskFilter.createBlurMaskFilter(type, sigma));
  return brush;
}

/**
 * Fill the shared rectangle with a brush and read the pixels back.
 *
 * @param { drawing.Brush } brush - Brush carrying the paint settings.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function rectWith(brush: drawing.Brush): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  target.canvas.attachBrush(brush);
  target.canvas.drawRect(LEFT, TOP, RIGHT, BOTTOM);
  target.canvas.detachBrush();
  return readPixelBuffer(target.pixelMap);
}

/**
 * Fill the shared rectangle with a blur mask filter applied.
 *
 * @param { drawing.BlurType } type - Blur style.
 * @param { number } sigma - Gaussian sigma, must be positive.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function blurredRect(type: drawing.BlurType, sigma: number): Promise<ArrayBuffer> {
  return rectWith(maskedBrush(type, sigma));
}

/**
 * Fill the shared rectangle without any mask filter.
 *
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function plainRect(): Promise<ArrayBuffer> {
  return rectWith(plainBrush());
}

export default function enumBlurTypeTest() {
  describe('EnumBlurTypeTest', () => {
    /** @tc.number SUB_NdkTsDrawing_ENUM_0548
     * @tc.name testEnumBlurType0548
     * @tc.desc Verify BlurType.NORMAL keeps index 0 and blurs past the shape edge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumBlurType0548', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0548 begin');
      await runCase('testEnumBlurType0548', async () => {
        expect(drawing.BlurType.NORMAL).assertEqual(0);
        expect(drawing.BlurType.NORMAL < drawing.BlurType.SOLID).assertTrue();
        const buffer: ArrayBuffer = await blurredRect(drawing.BlurType.NORMAL, SIGMA);
        expect(outerInk(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0548 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0549
     * @tc.name testEnumBlurType0549
     * @tc.desc Verify a normal blur keeps the interior painted and produces soft edges.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlurType0549', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0549 begin');
      await runCase('testEnumBlurType0549', async () => {
        const buffer: ArrayBuffer = await blurredRect(drawing.BlurType.NORMAL, SIGMA);
        expect(alphaAt(buffer, CENTER_X, CENTER_Y) > 0).assertTrue();
        expect(partialAlpha(buffer) > 0).assertTrue();
        expect(maxAlpha(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0549 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0550
     * @tc.name testEnumBlurType0550
     * @tc.desc Verify the outer band stays empty without a filter and is painted with NORMAL.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlurType0550', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0550 begin');
      await runCase('testEnumBlurType0550', async () => {
        const buffer: ArrayBuffer = await blurredRect(drawing.BlurType.NORMAL, SIGMA);
        const plain: ArrayBuffer = await plainRect();
        expect(outerInk(plain)).assertEqual(0);
        expect(outerInk(buffer) > 0).assertTrue();
        expect(inkBox(buffer, 20, 20, 180, SIZE) > inkBox(plain, 20, 20, 180, SIZE)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0550 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0551
     * @tc.name testEnumBlurType0551
     * @tc.desc Verify NORMAL differs from the unfiltered rectangle and widens its painted area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumBlurType0551', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0551 begin');
      await runCase('testEnumBlurType0551', async () => {
        const buffer: ArrayBuffer = await blurredRect(drawing.BlurType.NORMAL, SIGMA);
        const plain: ArrayBuffer = await plainRect();
        expect(diffCount(buffer, plain) > 0).assertTrue();
        expect(countInkedPixels(buffer) > countInkedPixels(plain)).assertTrue();
        expect(alphaAt(buffer, CENTER_X, CENTER_Y)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0551 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0552
     * @tc.name testEnumBlurType0552
     * @tc.desc Verify a normal blur leaves a wide soft rim while the far background stays clear.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlurType0552', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0552 begin');
      await runCase('testEnumBlurType0552', async () => {
        const buffer: ArrayBuffer = await blurredRect(drawing.BlurType.NORMAL, 4);
        expect(partialAlpha(buffer) > 100).assertTrue();
        expect(inkBox(buffer, 20, 20, 180, TOP) > 0).assertTrue();
        expect(alphaAt(buffer, CENTER_X, 20)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0552 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0553
     * @tc.name testEnumBlurType0553
     * @tc.desc Verify a larger sigma widens the normal blur reach.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumBlurType0553', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0553 begin');
      await runCase('testEnumBlurType0553', async () => {
        const narrow: ArrayBuffer = await blurredRect(drawing.BlurType.NORMAL, 4);
        const wide: ArrayBuffer = await blurredRect(drawing.BlurType.NORMAL, 10);
        expect(outerInk(narrow) > 0).assertTrue();
        expect(outerInk(wide) > outerInk(narrow)).assertTrue();
        expect(alphaAt(wide, CENTER_X, CENTER_Y)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0553 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0554
     * @tc.name testEnumBlurType0554
     * @tc.desc Verify NORMAL spreads outside the shape like SOLID but never keeps a harder core.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumBlurType0554', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0554 begin');
      await runCase('testEnumBlurType0554', async () => {
        const normal: ArrayBuffer = await blurredRect(drawing.BlurType.NORMAL, SIGMA);
        const solid: ArrayBuffer = await blurredRect(drawing.BlurType.SOLID, SIGMA);
        expect(alphaAt(solid, CENTER_X, CENTER_Y) >= alphaAt(normal, CENTER_X, CENTER_Y)).assertTrue();
        expect(outerInk(normal) > 0).assertTrue();
        expect(outerInk(solid) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0554 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0555
     * @tc.name testEnumBlurType0555
     * @tc.desc Verify BlurType.SOLID keeps index 1 and an opaque core.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumBlurType0555', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0555 begin');
      await runCase('testEnumBlurType0555', async () => {
        expect(drawing.BlurType.SOLID).assertEqual(1);
        expect(drawing.BlurType.SOLID < drawing.BlurType.OUTER).assertTrue();
        const buffer: ArrayBuffer = await blurredRect(drawing.BlurType.SOLID, SIGMA);
        expect(alphaAt(buffer, CENTER_X, CENTER_Y)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0555 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0556
     * @tc.name testEnumBlurType0556
     * @tc.desc Verify a solid blur keeps full opacity inside and a soft rim outside.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlurType0556', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0556 begin');
      await runCase('testEnumBlurType0556', async () => {
        const buffer: ArrayBuffer = await blurredRect(drawing.BlurType.SOLID, SIGMA);
        expect(outerInk(buffer) > 0).assertTrue();
        expect(partialAlpha(buffer) > 0).assertTrue();
        expect(maxAlpha(buffer)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0556 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0557
     * @tc.name testEnumBlurType0557
     * @tc.desc Verify SOLID changes the pixels of the unfiltered rectangle on both sides of the edge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlurType0557', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0557 begin');
      await runCase('testEnumBlurType0557', async () => {
        const buffer: ArrayBuffer = await blurredRect(drawing.BlurType.SOLID, SIGMA);
        const plain: ArrayBuffer = await plainRect();
        expect(diffCount(buffer, plain) > 0).assertTrue();
        expect(innerInk(buffer) > 0).assertTrue();
        expect(outerInk(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0557 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0558
     * @tc.name testEnumBlurType0558
     * @tc.desc Verify SOLID leaves the interior count untouched while adding an outer rim.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumBlurType0558', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0558 begin');
      await runCase('testEnumBlurType0558', async () => {
        const solid: ArrayBuffer = await blurredRect(drawing.BlurType.SOLID, SIGMA);
        const base: ArrayBuffer = await plainRect();
        expect(outerInk(solid) > outerInk(base)).assertTrue();
        expect(innerInk(solid)).assertEqual(innerInk(base));
        expect(alphaAt(solid, CENTER_X, CENTER_Y)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0558 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0559
     * @tc.name testEnumBlurType0559
     * @tc.desc Verify SOLID widens its rim with sigma and keeps the core opaque.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumBlurType0559', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0559 begin');
      await runCase('testEnumBlurType0559', async () => {
        const narrow: ArrayBuffer = await blurredRect(drawing.BlurType.SOLID, 4);
        const wide: ArrayBuffer = await blurredRect(drawing.BlurType.SOLID, 10);
        expect(outerInk(wide) > outerInk(narrow)).assertTrue();
        expect(innerInk(narrow)).assertEqual(innerInk(wide));
        expect(alphaAt(wide, CENTER_X, CENTER_Y)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0559 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0560
     * @tc.name testEnumBlurType0560
     * @tc.desc Verify the whole inner square of a solid blur stays fully opaque.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlurType0560', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0560 begin');
      await runCase('testEnumBlurType0560', async () => {
        const buffer: ArrayBuffer = await blurredRect(drawing.BlurType.SOLID, SIGMA);
        expect(alphaAt(buffer, CENTER_X, CENTER_Y)).assertEqual(255);
        expect(alphaAt(buffer, CENTER_X - 15, CENTER_Y + 15)).assertEqual(255);
        expect(innerInk(buffer)).assertEqual(1600);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0560 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0561
     * @tc.name testEnumBlurType0561
     * @tc.desc Verify SOLID and OUTER disagree on the shape interior.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumBlurType0561', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0561 begin');
      await runCase('testEnumBlurType0561', async () => {
        const solid: ArrayBuffer = await blurredRect(drawing.BlurType.SOLID, SIGMA);
        const outer: ArrayBuffer = await blurredRect(drawing.BlurType.OUTER, SIGMA);
        expect(diffCount(solid, outer) > 0).assertTrue();
        expect(alphaAt(outer, CENTER_X, CENTER_Y)).assertEqual(0);
        expect(alphaAt(solid, CENTER_X, CENTER_Y)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0561 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0562
     * @tc.name testEnumBlurType0562
     * @tc.desc Verify BlurType.OUTER keeps index 2 and leaves the shape interior transparent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumBlurType0562', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0562 begin');
      await runCase('testEnumBlurType0562', async () => {
        expect(drawing.BlurType.OUTER).assertEqual(2);
        expect(drawing.BlurType.OUTER < drawing.BlurType.INNER).assertTrue();
        const buffer: ArrayBuffer = await blurredRect(drawing.BlurType.OUTER, SIGMA);
        expect(alphaAt(buffer, CENTER_X, CENTER_Y)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0562 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0563
     * @tc.name testEnumBlurType0563
     * @tc.desc Verify an outer blur paints only the rim and nothing inside the shape.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlurType0563', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0563 begin');
      await runCase('testEnumBlurType0563', async () => {
        const buffer: ArrayBuffer = await blurredRect(drawing.BlurType.OUTER, SIGMA);
        expect(outerInk(buffer) > 0).assertTrue();
        expect(partialAlpha(buffer) > 0).assertTrue();
        expect(innerInk(buffer)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0563 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0564
     * @tc.name testEnumBlurType0564
     * @tc.desc Verify the outer blur reaches outside the edge but not the middle of the shape.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlurType0564', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0564 begin');
      await runCase('testEnumBlurType0564', async () => {
        const buffer: ArrayBuffer = await blurredRect(drawing.BlurType.OUTER, SIGMA);
        expect(alphaAt(buffer, CENTER_X, TOP - 4) > 0).assertTrue();
        expect(alphaAt(buffer, CENTER_X, CENTER_Y)).assertEqual(0);
        expect(inkBox(buffer, 90, 90, 110, 110)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0564 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0565
     * @tc.name testEnumBlurType0565
     * @tc.desc Verify OUTER removes the interior that the unfiltered rectangle keeps.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumBlurType0565', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0565 begin');
      await runCase('testEnumBlurType0565', async () => {
        const buffer: ArrayBuffer = await blurredRect(drawing.BlurType.OUTER, SIGMA);
        const plain: ArrayBuffer = await plainRect();
        expect(diffCount(buffer, plain) > 0).assertTrue();
        expect(innerInk(buffer)).assertEqual(0);
        expect(innerInk(plain) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0565 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0566
     * @tc.name testEnumBlurType0566
     * @tc.desc Verify a larger sigma widens the outer rim while the interior stays clear.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumBlurType0566', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0566 begin');
      await runCase('testEnumBlurType0566', async () => {
        const narrow: ArrayBuffer = await blurredRect(drawing.BlurType.OUTER, 4);
        const wide: ArrayBuffer = await blurredRect(drawing.BlurType.OUTER, 10);
        expect(outerInk(wide) > outerInk(narrow)).assertTrue();
        expect(alphaAt(wide, CENTER_X, CENTER_Y)).assertEqual(0);
        expect(partialAlpha(wide) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0566 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0567
     * @tc.name testEnumBlurType0567
     * @tc.desc Verify OUTER and NORMAL both blur but only NORMAL paints the core.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumBlurType0567', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0567 begin');
      await runCase('testEnumBlurType0567', async () => {
        const normal: ArrayBuffer = await blurredRect(drawing.BlurType.NORMAL, SIGMA);
        const outer: ArrayBuffer = await blurredRect(drawing.BlurType.OUTER, SIGMA);
        expect(diffCount(normal, outer) > 0).assertTrue();
        expect(alphaAt(normal, CENTER_X, CENTER_Y) > 0).assertTrue();
        expect(alphaAt(outer, CENTER_X, CENTER_Y)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0567 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0568
     * @tc.name testEnumBlurType0568
     * @tc.desc Verify the outer blur is strongest just outside the edge and empty further out.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlurType0568', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0568 begin');
      await runCase('testEnumBlurType0568', async () => {
        const buffer: ArrayBuffer = await blurredRect(drawing.BlurType.OUTER, SIGMA);
        const near: number = alphaAt(buffer, CENTER_X, TOP - 4);
        const far: number = alphaAt(buffer, CENTER_X, 20);
        expect(near > far).assertTrue();
        expect(near > 0).assertTrue();
        expect(alphaAt(buffer, CENTER_X, CENTER_Y)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0568 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0569
     * @tc.name testEnumBlurType0569
     * @tc.desc Verify BlurType.INNER keeps index 3 and keeps the outer edge sharp.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumBlurType0569', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0569 begin');
      await runCase('testEnumBlurType0569', async () => {
        expect(drawing.BlurType.INNER).assertEqual(3);
        expect(drawing.BlurType.INNER > drawing.BlurType.OUTER).assertTrue();
        const buffer: ArrayBuffer = await blurredRect(drawing.BlurType.INNER, SIGMA);
        expect(outerInk(buffer)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0569 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0570
     * @tc.name testEnumBlurType0570
     * @tc.desc Verify an inner blur paints the shape and never spreads outside it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlurType0570', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0570 begin');
      await runCase('testEnumBlurType0570', async () => {
        const buffer: ArrayBuffer = await blurredRect(drawing.BlurType.INNER, SIGMA);
        expect(alphaAt(buffer, CENTER_X, CENTER_Y) > 0).assertTrue();
        expect(outerInk(buffer)).assertEqual(0);
        expect(partialAlpha(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0570 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0571
     * @tc.name testEnumBlurType0571
     * @tc.desc Verify none of the four bands around an inner blur carries paint.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlurType0571', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0571 begin');
      await runCase('testEnumBlurType0571', async () => {
        const buffer: ArrayBuffer = await blurredRect(drawing.BlurType.INNER, SIGMA);
        expect(inkBox(buffer, 20, 20, 180, TOP)).assertEqual(0);
        expect(inkBox(buffer, 20, BOTTOM, 180, 180)).assertEqual(0);
        expect(inkBox(buffer, 20, TOP, LEFT, BOTTOM)).assertEqual(0);
        expect(inkBox(buffer, RIGHT, TOP, 180, BOTTOM)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0571 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0572
     * @tc.name testEnumBlurType0572
     * @tc.desc Verify INNER changes the pixels inside the shape while keeping the rim sharp.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumBlurType0572', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0572 begin');
      await runCase('testEnumBlurType0572', async () => {
        const buffer: ArrayBuffer = await blurredRect(drawing.BlurType.INNER, SIGMA);
        const plain: ArrayBuffer = await plainRect();
        expect(diffCount(buffer, plain) > 0).assertTrue();
        expect(innerInk(buffer) > 0).assertTrue();
        expect(outerInk(buffer)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0572 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0573
     * @tc.name testEnumBlurType0573
     * @tc.desc Verify INNER and OUTER are mirror images of each other.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumBlurType0573', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0573 begin');
      await runCase('testEnumBlurType0573', async () => {
        const outer: ArrayBuffer = await blurredRect(drawing.BlurType.OUTER, SIGMA);
        const inner: ArrayBuffer = await blurredRect(drawing.BlurType.INNER, SIGMA);
        expect(outerInk(outer) > 0).assertTrue();
        expect(alphaAt(outer, CENTER_X, CENTER_Y)).assertEqual(0);
        expect(outerInk(inner)).assertEqual(0);
        expect(alphaAt(inner, CENTER_X, CENTER_Y) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0573 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0574
     * @tc.name testEnumBlurType0574
     * @tc.desc Verify an inner blur fades towards the inner side of the shape edge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumBlurType0574', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0574 begin');
      await runCase('testEnumBlurType0574', async () => {
        const buffer: ArrayBuffer = await blurredRect(drawing.BlurType.INNER, SIGMA);
        const rim: number = alphaAt(buffer, CENTER_X, TOP + 4);
        const core: number = alphaAt(buffer, CENTER_X, CENTER_Y);
        expect(rim > 0).assertTrue();
        expect(rim < core).assertTrue();
        expect(outerInk(buffer)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0574 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0575
     * @tc.name testEnumBlurType0575
     * @tc.desc Verify a larger sigma keeps an inner blur inside the shape and raises its soft rim.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumBlurType0575', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0575 begin');
      await runCase('testEnumBlurType0575', async () => {
        const wide: ArrayBuffer = await blurredRect(drawing.BlurType.INNER, 10);
        expect(outerInk(wide)).assertEqual(0);
        expect(alphaAt(wide, CENTER_X, CENTER_Y) > 0).assertTrue();
        expect(maxAlpha(wide) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0575 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0576
     * @tc.name testEnumBlurType0576
     * @tc.desc Verify only INNER keeps the band outside the shape empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumBlurType0576', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0576 begin');
      await runCase('testEnumBlurType0576', async () => {
        const normal: ArrayBuffer = await blurredRect(drawing.BlurType.NORMAL, SIGMA);
        const solid: ArrayBuffer = await blurredRect(drawing.BlurType.SOLID, SIGMA);
        const outer: ArrayBuffer = await blurredRect(drawing.BlurType.OUTER, SIGMA);
        const inner: ArrayBuffer = await blurredRect(drawing.BlurType.INNER, SIGMA);
        expect(outerInk(normal) > 0).assertTrue();
        expect(outerInk(solid) > 0).assertTrue();
        expect(outerInk(outer) > 0).assertTrue();
        expect(outerInk(inner)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0576 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0577
     * @tc.name testEnumBlurType0577
     * @tc.desc Verify only OUTER leaves the middle of the shape empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumBlurType0577', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0577 begin');
      await runCase('testEnumBlurType0577', async () => {
        const normal: ArrayBuffer = await blurredRect(drawing.BlurType.NORMAL, SIGMA);
        const solid: ArrayBuffer = await blurredRect(drawing.BlurType.SOLID, SIGMA);
        const outer: ArrayBuffer = await blurredRect(drawing.BlurType.OUTER, SIGMA);
        const inner: ArrayBuffer = await blurredRect(drawing.BlurType.INNER, SIGMA);
        expect(alphaAt(outer, CENTER_X, CENTER_Y)).assertEqual(0);
        expect(alphaAt(solid, CENTER_X, CENTER_Y) > 0).assertTrue();
        expect(alphaAt(normal, CENTER_X, CENTER_Y) > 0).assertTrue();
        expect(alphaAt(inner, CENTER_X, CENTER_Y) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlurType0577 end');
    });
  });
}
