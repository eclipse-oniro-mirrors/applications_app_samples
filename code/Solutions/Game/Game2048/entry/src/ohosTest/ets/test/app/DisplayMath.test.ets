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

import { describe, beforeAll, beforeEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { screenSizeType } from '../../../../main/ets/model/GameModuel';
import { BoardKit } from '../common/Game2048TestKit';

/**
 * 尺寸派生纯函数镜像。
 *
 * Index.aboutToAppear 在 display.getDefaultDisplay 回调里做两件事：
 *   1. 用原始像素判断 height > width，决定纵向还是横向；
 *   2. 纵向时 x 取屏幕宽、y 取屏幕高，横向时 x 取固定的 750、y 取屏幕宽，
 *      两者都经过 px2vp 换算。
 * 这些函数逐行镜像上述算式，但不调用任何 display 接口，因此用例不依赖
 * 真机分辨率与密度，也不会因为设备旋转而漂移。
 */

/** px2vp 换算时横向分支使用的固定像素宽度。 */
const REFERENCE_WIDTH_PX: number = 750;
/** 设备可能上报的低密度。 */
const DENSITY_LOW: number = 1;
/** 设备可能上报的中密度。 */
const DENSITY_MID: number = 2;
/** 设备可能上报的高密度。 */
const DENSITY_HIGH: number = 3;
/** 部分平板与折叠屏上报的小数密度。 */
const DENSITY_FRACTIONAL: number = 1.5;

/** 把像素长度按给定密度换算成 vp，等价于全局 px2vp。 */
function toVp(pixels: number, density: number): number {
  return pixels / density;
}

/** 纵向分支判据：高度严格大于宽度才算纵向。 */
function isPortrait(widthPx: number, heightPx: number): boolean {
  return heightPx > widthPx;
}

/** 镜像 aboutToAppear 中 screenSize 的两次赋值。 */
function deriveScreenSize(widthPx: number, heightPx: number, density: number): screenSizeType {
  let size: screenSizeType = { x: 0, y: 0 };
  if (isPortrait(widthPx, heightPx)) {
    size = { x: toVp(widthPx, density), y: toVp(heightPx, density) };
  } else {
    size = { x: toVp(REFERENCE_WIDTH_PX, density), y: toVp(widthPx, density) };
  }
  return size;
}

/**
 * 带参数的派生：密度非正或像素为负时返回 null。
 * 真实回调不会传入这种输入，这里只用于固化入参校验的边界语义。
 */
function deriveScreenSizeOrNull(widthPx: number, heightPx: number, density: number): screenSizeType | null {
  if (density <= 0 || widthPx < 0 || heightPx < 0) {
    return null;
  }
  return deriveScreenSize(widthPx, heightPx, density);
}

/**
 * 只返回横向分支的 750 兜底宽度（vp）。
 * 纵向分支不读取该兜底值，所以返回 undefined。
 */
function fallbackVp(portrait: boolean, density: number): number | undefined {
  if (portrait) {
    return undefined;
  }
  return toVp(REFERENCE_WIDTH_PX, density);
}

/** 生成稳定的分支标签，供日志与字符串断言使用。 */
function orientationLabel(widthPx: number, heightPx: number): string {
  let branch: string = isPortrait(widthPx, heightPx) ? 'portrait' : 'landscape';
  return branch + ' ' + widthPx + 'x' + heightPx;
}

/** 八组常见分辨率及其期望的 vp 结果，供表驱动用例使用。 */
const TABLE_WIDTH: number[] = [720, 1080, 1920, 2560, 1280, 1600, 1200, 1920];
const TABLE_HEIGHT: number[] = [1280, 1920, 1080, 1600, 720, 2560, 1920, 1200];
const TABLE_DENSITY: number[] = [2, 3, 3, 2, 2, 2, 2, 2];
const TABLE_EXPECT_X: number[] = [360, 360, 250, 375, 375, 800, 600, 375];
const TABLE_EXPECT_Y: number[] = [640, 640, 640, 1280, 640, 1280, 960, 960];
const TABLE_PORTRAIT: boolean[] = [true, true, false, false, false, true, true, false];

/**
 * Index.aboutToAppear 尺寸派生测试套件。
 */
export default function displayMathTest() {
  describe('displayMathTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('displayMathTest', 'suite begin');
    });

    afterAll(() => {
      BoardKit.log('displayMathTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_0100
     * @tc.name displayMathPortraitDerivesBothAxes0100
     * @tc.desc Verify a 720x1280 portrait panel maps x to the width and y to the height in vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_portraitDerivesBothAxes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let size: screenSizeType = deriveScreenSize(720, 1280, DENSITY_MID);
      expect(size.x).assertEqual(360);
      expect(size.y).assertEqual(640);
      expect(size.y > size.x).assertTrue();
      BoardKit.log('portraitDerivesBothAxes', 'x ' + size.x + ' y ' + size.y);
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_0200
     * @tc.name displayMathPortraitDensityOne0200
     * @tc.desc Verify a density of one keeps the raw 1080x1920 pixels as vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_portraitDensityOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let size: screenSizeType = deriveScreenSize(1080, 1920, DENSITY_LOW);
      expect(size.x).assertEqual(1080);
      expect(size.y).assertEqual(1920);
      expect(size.x !== size.y).assertTrue();
      expect(size.y === 1920).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_0300
     * @tc.name displayMathPortraitDensityFractional0300
     * @tc.desc Verify a 1.5 density scales both portrait axes by two thirds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_portraitDensityFractional', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let size: screenSizeType = deriveScreenSize(1080, 1920, DENSITY_FRACTIONAL);
      expect(size.x).assertEqual(720);
      expect(size.y).assertEqual(1280);
      expect(size.x).assertEqual(1080 / DENSITY_FRACTIONAL);
      expect(size.y).assertEqual(1920 / DENSITY_FRACTIONAL);
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_0400
     * @tc.name displayMathPortraitFractionalHeight0400
     * @tc.desc Verify a 1440x2560 portrait panel keeps the fractional height of 2560/3 vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_portraitFractionalHeight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let size: screenSizeType = deriveScreenSize(1440, 2560, DENSITY_HIGH);
      expect(size.x).assertEqual(480);
      expect(size.y).assertEqual(2560 / DENSITY_HIGH);
      expect(size.y > 853).assertTrue();
      expect(size.y < 854).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_0500
     * @tc.name displayMathPortraitHeightMinusOne0500
     * @tc.desc Verify a panel one pixel taller than wide still takes the portrait branch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_portraitHeightMinusOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let size: screenSizeType = deriveScreenSize(1079, 1080, DENSITY_LOW);
      expect(size.x).assertEqual(1079);
      expect(size.y).assertEqual(1080);
      expect(size.y - size.x).assertEqual(1);
      expect(isPortrait(1079, 1080)).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_0600
     * @tc.name displayMathPortraitNarrow0600
     * @tc.desc Verify a narrow 600x2400 portrait panel derives 200 by 800 vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_portraitNarrow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let size: screenSizeType = deriveScreenSize(600, 2400, DENSITY_HIGH);
      expect(size.x).assertEqual(200);
      expect(size.y).assertEqual(800);
      expect(size.y).assertEqual(size.x * 4);
      expect(size.x <= 200).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_0700
     * @tc.name displayMathPortraitTiny0700
     * @tc.desc Verify the smallest portrait input of 1x2 pixels derives a 1 by 2 vp size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_portraitTiny', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let size: screenSizeType = deriveScreenSize(1, 2, DENSITY_LOW);
      expect(size.x).assertEqual(1);
      expect(size.y).assertEqual(2);
      expect(size.x > 0).assertTrue();
      expect(size.y > 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_0800
     * @tc.name displayMathPortraitHuge0800
     * @tc.desc Verify a 100000x200000 portrait surface keeps exact fractional vp values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_portraitHuge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let size: screenSizeType = deriveScreenSize(100000, 200000, DENSITY_HIGH);
      expect(size.x).assertEqual(100000 / DENSITY_HIGH);
      expect(size.y).assertEqual(200000 / DENSITY_HIGH);
      expect(size.y).assertEqual(size.x * 2);
      BoardKit.log('portraitHuge', 'x ' + size.x + ' y ' + size.y);
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_0900
     * @tc.name displayMathPortraitIgnoresReference0900
     * @tc.desc Verify the 750 fallback width never leaks into a portrait result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_portraitIgnoresReference', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let size: screenSizeType = deriveScreenSize(1080, 1920, DENSITY_HIGH);
      let reference: number = toVp(REFERENCE_WIDTH_PX, DENSITY_HIGH);
      expect(size.x).assertEqual(360);
      expect(reference).assertEqual(250);
      expect(size.x === reference).assertFalse();
      expect(size.x !== reference).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_1000
     * @tc.name displayMathLandscapeBasic1000
     * @tc.desc Verify a 1920x1080 landscape surface maps x to 750 px and y to the width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_landscapeBasic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let size: screenSizeType = deriveScreenSize(1920, 1080, DENSITY_HIGH);
      expect(size.x).assertEqual(250);
      expect(size.y).assertEqual(640);
      expect(size.y > size.x).assertTrue();
      BoardKit.log('landscapeBasic', 'x ' + size.x + ' y ' + size.y);
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_1100
     * @tc.name displayMathLandscapeDensityOne1100
     * @tc.desc Verify a density of one keeps the reference width at 750 vp in landscape
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_landscapeDensityOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let size: screenSizeType = deriveScreenSize(1280, 720, DENSITY_LOW);
      expect(size.x).assertEqual(REFERENCE_WIDTH_PX);
      expect(size.y).assertEqual(1280);
      expect(size.x).assertEqual(750);
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_1200
     * @tc.name displayMathLandscapeDensityTwo1200
     * @tc.desc Verify a 1280x720 landscape panel derives 375 by 640 vp at density two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_landscapeDensityTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let size: screenSizeType = deriveScreenSize(1280, 720, DENSITY_MID);
      expect(size.x).assertEqual(375);
      expect(size.y).assertEqual(640);
      expect(size.x).assertEqual(REFERENCE_WIDTH_PX / DENSITY_MID);
      expect(size.y).assertEqual(1280 / DENSITY_MID);
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_1300
     * @tc.name displayMathLandscapeWide1300
     * @tc.desc Verify a 2560x1440 landscape panel keeps the fractional height 1440/3 vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_landscapeWide', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let size: screenSizeType = deriveScreenSize(2560, 1440, DENSITY_HIGH);
      expect(size.x).assertEqual(250);
      expect(size.y).assertEqual(2560 / DENSITY_HIGH);
      expect(size.y > size.x).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_1400
     * @tc.name displayMathLandscapeSquare1400
     * @tc.desc Verify a 1080x1080 square takes the landscape branch and ignores the width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_landscapeSquare', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let size: screenSizeType = deriveScreenSize(1080, 1080, DENSITY_HIGH);
      expect(size.x).assertEqual(250);
      expect(size.y).assertEqual(360);
      expect(size.x === toVp(1080, DENSITY_HIGH)).assertFalse();
      expect(isPortrait(1080, 1080)).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_1500
     * @tc.name displayMathLandscapeSquareTiny1500
     * @tc.desc Verify a 1x1 surface still reports the full 750 px reference width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_landscapeSquareTiny', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let size: screenSizeType = deriveScreenSize(1, 1, DENSITY_LOW);
      expect(size.x).assertEqual(750);
      expect(size.y).assertEqual(1);
      expect(size.x > size.y).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_1600
     * @tc.name displayMathLandscapeWidthMinusOne1600
     * @tc.desc Verify a panel one pixel wider than tall takes the landscape branch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_landscapeWidthMinusOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let size: screenSizeType = deriveScreenSize(1081, 1080, DENSITY_LOW);
      expect(size.x).assertEqual(750);
      expect(size.y).assertEqual(1081);
      expect(size.y - size.x).assertEqual(331);
      expect(isPortrait(1081, 1080)).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_1700
     * @tc.name displayMathLandscapeNarrowWidth1700
     * @tc.desc Verify a 500x300 landscape width below the reference makes x exceed y
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_landscapeNarrowWidth', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let size: screenSizeType = deriveScreenSize(500, 300, DENSITY_HIGH);
      expect(size.x).assertEqual(250);
      expect(size.y).assertEqual(500 / DENSITY_HIGH);
      expect(size.x > size.y).assertTrue();
      BoardKit.log('landscapeNarrowWidth', 'x ' + size.x + ' y ' + size.y);
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_1800
     * @tc.name displayMathLandscapeHuge1800
     * @tc.desc Verify a 200000x100000 landscape surface keeps the fixed reference width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_landscapeHuge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let size: screenSizeType = deriveScreenSize(200000, 100000, DENSITY_HIGH);
      expect(size.x).assertEqual(250);
      expect(size.y).assertEqual(200000 / DENSITY_HIGH);
      expect(size.x < size.y).assertTrue();
      expect(size.y > 66666).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_1900
     * @tc.name displayMathLandscapeWidthEqualsReference1900
     * @tc.desc Verify a landscape width of exactly 750 px makes both axes equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_landscapeWidthEqualsReference', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let size: screenSizeType = deriveScreenSize(750, 500, DENSITY_HIGH);
      expect(size.x).assertEqual(250);
      expect(size.y).assertEqual(250);
      expect(size.x === size.y).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_2000
     * @tc.name displayMathLandscapeReferenceScaled2000
     * @tc.desc Verify the landscape reference width is divided by every supported density
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_landscapeReferenceScaled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let low: screenSizeType = deriveScreenSize(1920, 1080, DENSITY_LOW);
      let mid: screenSizeType = deriveScreenSize(1920, 1080, DENSITY_MID);
      let high: screenSizeType = deriveScreenSize(1920, 1080, DENSITY_HIGH);
      expect(low.x).assertEqual(750);
      expect(mid.x).assertEqual(375);
      expect(high.x).assertEqual(250);
      expect(low.x).assertEqual(mid.x * 2);
      expect(mid.x).assertEqual(high.x * 1.5);
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_2100
     * @tc.name displayMathLandscapeWidthDoesNotAffectX2100
     * @tc.desc Verify two landscape panels of different widths share the same x but differ in y
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_landscapeWidthDoesNotAffectX', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let wide: screenSizeType = deriveScreenSize(1920, 1080, DENSITY_HIGH);
      let narrow: screenSizeType = deriveScreenSize(1080, 720, DENSITY_HIGH);
      expect(wide.x).assertEqual(narrow.x);
      expect(wide.y).assertEqual(640);
      expect(narrow.y).assertEqual(360);
      expect(wide.y === narrow.y).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_2200
     * @tc.name displayMathLandscapeYIgnoresReference2200
     * @tc.desc Verify the landscape y axis comes from the panel width, not from 750
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_landscapeYIgnoresReference', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let size: screenSizeType = deriveScreenSize(1920, 1080, DENSITY_HIGH);
      expect(size.y).assertEqual(1920 / DENSITY_HIGH);
      expect(size.y === REFERENCE_WIDTH_PX / DENSITY_HIGH).assertFalse();
      expect(size.y !== 250).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_2300
     * @tc.name displayMathSquareUsesReference2300
     * @tc.desc Verify a square panel reports the reference width instead of its own width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_squareUsesReference', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let size: screenSizeType = deriveScreenSize(1080, 1080, DENSITY_MID);
      expect(size.x).assertEqual(375);
      expect(size.y).assertEqual(540);
      expect(size.x === toVp(1080, DENSITY_MID)).assertFalse();
      expect(size.x).assertEqual(toVp(REFERENCE_WIDTH_PX, DENSITY_MID));
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_2400
     * @tc.name displayMathPx2vpDensityOne2400
     * @tc.desc Verify the px2vp mirror is the identity when density is one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_px2vpDensityOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(toVp(1080, DENSITY_LOW)).assertEqual(1080);
      expect(toVp(1, DENSITY_LOW)).assertEqual(1);
      expect(toVp(1080, DENSITY_LOW) === 1080).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_2500
     * @tc.name displayMathPx2vpDensityTwo2500
     * @tc.desc Verify the px2vp mirror halves a pixel length at density two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_px2vpDensityTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(toVp(1080, DENSITY_MID)).assertEqual(540);
      expect(toVp(750, DENSITY_MID)).assertEqual(375);
      expect(toVp(1080, DENSITY_MID) * DENSITY_MID).assertEqual(1080);
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_2600
     * @tc.name displayMathPx2vpDensityThree2600
     * @tc.desc Verify the px2vp mirror divides a pixel length by three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_px2vpDensityThree', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(toVp(1080, DENSITY_HIGH)).assertEqual(360);
      expect(toVp(1920, DENSITY_HIGH)).assertEqual(640);
      expect(toVp(1080, DENSITY_HIGH)).assertEqual(1080 / DENSITY_HIGH);
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_2700
     * @tc.name displayMathPx2vpDensityFractional2700
     * @tc.desc Verify the px2vp mirror multiplies by two thirds at density 1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_px2vpDensityFractional', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(toVp(1080, DENSITY_FRACTIONAL)).assertEqual(720);
      expect(toVp(750, DENSITY_FRACTIONAL)).assertEqual(500);
      expect(toVp(1080, DENSITY_FRACTIONAL) === 720).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_2800
     * @tc.name displayMathPx2vpZero2800
     * @tc.desc Verify a zero pixel input maps to zero vp, matching the initial placeholder height
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_px2vpZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(toVp(0, DENSITY_LOW)).assertEqual(0);
      expect(toVp(0, DENSITY_MID)).assertEqual(0);
      expect(toVp(0, DENSITY_HIGH)).assertEqual(0);
      expect(toVp(0, DENSITY_HIGH) === 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_2900
     * @tc.name displayMathPx2vpRoundTrip2900
     * @tc.desc Verify converting a vp value back through its density restores the original pixels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_px2vpRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let vp: number = toVp(1080, DENSITY_HIGH);
      expect(vp).assertEqual(360);
      expect(vp * DENSITY_HIGH).assertEqual(1080);
      expect(toVp(vp * DENSITY_HIGH, DENSITY_HIGH)).assertEqual(360);
      BoardKit.log('px2vpRoundTrip', 'px 1080 -> vp ' + vp);
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_3000
     * @tc.name displayMathPx2vpFractionalResult3000
     * @tc.desc Verify an odd pixel length keeps a fractional vp result instead of rounding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_px2vpFractionalResult', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(toVp(5, DENSITY_MID)).assertEqual(2.5);
      expect(toVp(3, DENSITY_MID)).assertEqual(1.5);
      expect(toVp(5, DENSITY_MID) === 2).assertFalse();
      expect(toVp(5, DENSITY_MID) > 2).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_3100
     * @tc.name displayMathOrientationBoundaryTable3100
     * @tc.desc Verify the portrait predicate flips exactly on the height greater than width edge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_orientationBoundaryTable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(isPortrait(1079, 1080)).assertTrue();
      expect(isPortrait(1080, 1080)).assertFalse();
      expect(isPortrait(1080, 1079)).assertFalse();
      expect(isPortrait(0, 1)).assertTrue();
      expect(isPortrait(1, 0)).assertFalse();
      expect(isPortrait(0, 0)).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_3200
     * @tc.name displayMathBoundaryHeightMinusOne3200
     * @tc.desc Verify a 2559x2560 panel stays portrait by exactly one pixel of height
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_boundaryHeightMinusOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let size: screenSizeType = deriveScreenSize(2559, 2560, DENSITY_LOW);
      expect(size.x).assertEqual(2559);
      expect(size.y).assertEqual(2560);
      expect(size.y - size.x).assertEqual(1);
      expect(size.x === 750).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_3300
     * @tc.name displayMathBoundaryHeightPlusOne3300
     * @tc.desc Verify a 2560x2559 panel stays landscape by exactly one pixel of width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_boundaryHeightPlusOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let size: screenSizeType = deriveScreenSize(2560, 2559, DENSITY_LOW);
      expect(size.x).assertEqual(750);
      expect(size.y).assertEqual(2560);
      expect(size.x === size.y).assertFalse();
      expect(size.y - size.x).assertEqual(1810);
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_3400
     * @tc.name displayMathBoundaryZeroHeight3400
     * @tc.desc Verify a zero height panel falls into the landscape branch without dividing by zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_boundaryZeroHeight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let size: screenSizeType = deriveScreenSize(1080, 0, DENSITY_HIGH);
      expect(size.x).assertEqual(250);
      expect(size.y).assertEqual(360);
      expect(size.y === 0).assertFalse();
      expect(size.x > 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_3500
     * @tc.name displayMathPortraitPositive3500
     * @tc.desc Verify every portrait derived length is strictly positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_portraitPositive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let size: screenSizeType = deriveScreenSize(720, 1280, DENSITY_MID);
      expect(size.x > 0).assertTrue();
      expect(size.y > 0).assertTrue();
      expect(size.x <= 0).assertFalse();
      expect(size.y <= 0).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_3600
     * @tc.name displayMathLandscapePositive3600
     * @tc.desc Verify every landscape derived length is strictly positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_landscapePositive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let size: screenSizeType = deriveScreenSize(1920, 1080, DENSITY_HIGH);
      expect(size.x > 0).assertTrue();
      expect(size.y > 0).assertTrue();
      expect(size.x === 0).assertFalse();
      expect(size.y === 0).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_3700
     * @tc.name displayMathResolutionTable3700
     * @tc.desc Verify eight common resolutions match their expected vp width and height
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_resolutionTable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      for (let index: number = 0; index < TABLE_WIDTH.length; index++) {
        let size: screenSizeType = deriveScreenSize(TABLE_WIDTH[index], TABLE_HEIGHT[index], TABLE_DENSITY[index]);
        expect(size.x).assertEqual(TABLE_EXPECT_X[index]);
        expect(size.y).assertEqual(TABLE_EXPECT_Y[index]);
        expect(isPortrait(TABLE_WIDTH[index], TABLE_HEIGHT[index])).assertEqual(TABLE_PORTRAIT[index]);
        if (TABLE_PORTRAIT[index]) {
          expect(size.y > size.x).assertTrue();
        } else {
          expect(size.x).assertEqual(REFERENCE_WIDTH_PX / TABLE_DENSITY[index]);
        }
      }
      BoardKit.log('resolutionTable', 'rows ' + TABLE_WIDTH.length);
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_3800
     * @tc.name displayMathResolutionTablePositive3800
     * @tc.desc Verify every resolution in the table derives two positive lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_resolutionTablePositive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      for (let index: number = 0; index < TABLE_WIDTH.length; index++) {
        let size: screenSizeType = deriveScreenSize(TABLE_WIDTH[index], TABLE_HEIGHT[index], TABLE_DENSITY[index]);
        expect(size.x > 0).assertTrue();
        expect(size.y > 0).assertTrue();
        expect(size.x === 0).assertFalse();
      }
      expect(TABLE_WIDTH.length).assertEqual(8);
      expect(TABLE_PORTRAIT.length).assertEqual(TABLE_WIDTH.length);
      expect(TABLE_EXPECT_Y.length).assertEqual(TABLE_WIDTH.length);
      expect(TABLE_DENSITY.length).assertEqual(TABLE_WIDTH.length);
      expect(TABLE_EXPECT_X.length).assertEqual(TABLE_HEIGHT.length);
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_3900
     * @tc.name displayMathDensityScalingInverse3900
     * @tc.desc Verify halving the density doubles both derived lengths for the same pixels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_densityScalingInverse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let low: screenSizeType = deriveScreenSize(1280, 720, DENSITY_LOW);
      let mid: screenSizeType = deriveScreenSize(1280, 720, DENSITY_MID);
      expect(low.x).assertEqual(mid.x * 2);
      expect(low.y).assertEqual(mid.y * 2);
      expect(low.x > mid.x).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_4000
     * @tc.name displayMathResultShape4000
     * @tc.desc Verify the derived value carries exactly the two numeric screenSize fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_resultShape', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let size: screenSizeType = deriveScreenSize(1080, 1920, DENSITY_HIGH);
      expect(typeof size.x).assertEqual('number');
      expect(typeof size.y).assertEqual('number');
      expect(size.x === 360).assertTrue();
      expect(size.y === 640).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_4100
     * @tc.name displayMathNullForInvalidDensity4100
     * @tc.desc Verify a non positive density yields null instead of an infinite length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_nullForInvalidDensity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let zeroDensity: screenSizeType | null = deriveScreenSizeOrNull(1080, 1920, 0);
      let negativeWidth: screenSizeType | null = deriveScreenSizeOrNull(-1, 1920, DENSITY_MID);
      expect(zeroDensity).assertNull();
      expect(negativeWidth).assertNull();
      BoardKit.warn('nullForInvalidDensity', 'invalid inputs rejected');
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_4200
     * @tc.name displayMathValidInputNotNull4200
     * @tc.desc Verify a legal input never yields null and keeps the derived values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_validInputNotNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let size: screenSizeType | null = deriveScreenSizeOrNull(1080, 1920, DENSITY_HIGH);
      expect(size === null).assertFalse();
      if (size !== null) {
        expect(size.x).assertEqual(360);
        expect(size.y).assertEqual(640);
      }
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_4300
     * @tc.name displayMathFallbackUndefinedForPortrait4300
     * @tc.desc Verify the 750 fallback lookup is undefined in portrait and 250 vp in landscape
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_fallbackUndefinedForPortrait', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(fallbackVp(true, DENSITY_HIGH)).assertUndefined();
      expect(fallbackVp(false, DENSITY_HIGH)).assertEqual(250);
      expect(fallbackVp(false, DENSITY_MID)).assertEqual(375);
      expect(fallbackVp(false, DENSITY_LOW)).assertEqual(750);
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_4400
     * @tc.name displayMathLabelContainsBranch4400
     * @tc.desc Verify the orientation label names the portrait branch and the raw resolution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_labelContainsBranch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let portrait: string = orientationLabel(1080, 1920);
      let landscape: string = orientationLabel(1920, 1080);
      expect(portrait).assertContain('portrait');
      expect(portrait).assertContain('1080x1920');
      expect(landscape).assertContain('landscape');
      expect(landscape).assertContain('1920x1080');
      expect(landscape).assertContain('x');
      expect(landscape === portrait).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_4500
     * @tc.name displayMathInitialPlaceholder4500
     * @tc.desc Verify the initial screenSize placeholder keeps a zero height and a positive width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_initialPlaceholder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let initial: screenSizeType = { x: toVp(1080, DENSITY_HIGH), y: toVp(0, DENSITY_HIGH) };
      expect(initial.x).assertEqual(360);
      expect(initial.y).assertEqual(0);
      expect(initial.y === 0).assertTrue();
      expect(initial.x > initial.y).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_4600
     * @tc.name displayMathSwapAxisSymmetry4600
     * @tc.desc Verify swapping width and height keeps y on the shared long edge and moves x
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_swapAxisSymmetry', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let portrait: screenSizeType = deriveScreenSize(1080, 1920, DENSITY_HIGH);
      let landscape: screenSizeType = deriveScreenSize(1920, 1080, DENSITY_HIGH);
      expect(portrait.y).assertEqual(640);
      expect(landscape.y).assertEqual(640);
      expect(portrait.y).assertEqual(landscape.y);
      expect(portrait.x).assertEqual(360);
      expect(landscape.x).assertEqual(250);
      expect(portrait.x === landscape.x).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_4700
     * @tc.name displayMathPortraitRatioIndependentOfDensity4700
     * @tc.desc Verify the portrait height to width ratio stays the pixel ratio at every density
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_portraitRatioIndependentOfDensity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let low: screenSizeType = deriveScreenSize(1080, 1920, DENSITY_LOW);
      let high: screenSizeType = deriveScreenSize(1080, 1920, DENSITY_HIGH);
      expect(low.y / low.x).assertEqual(high.y / high.x);
      expect(low.y / low.x).assertEqual(1920 / 1080);
      expect(low.x > high.x).assertTrue();
      BoardKit.log('portraitRatio', 'ratio ' + (low.y / low.x));
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_4800
     * @tc.name displayMathLandscapeRatioIndependentOfDensity4800
     * @tc.desc Verify the landscape height to width ratio equals panel width over 750 at any density
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_landscapeRatioIndependentOfDensity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mid: screenSizeType = deriveScreenSize(1920, 1080, DENSITY_MID);
      let high: screenSizeType = deriveScreenSize(1920, 1080, DENSITY_HIGH);
      expect(mid.y / mid.x).assertEqual(1920 / REFERENCE_WIDTH_PX);
      expect(high.y / high.x).assertEqual(1920 / REFERENCE_WIDTH_PX);
      expect(mid.y / mid.x).assertEqual(high.y / high.x);
      expect(mid.x === high.x).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_4900
     * @tc.name displayMathDensityMonotonicDecrease4900
     * @tc.desc Verify both axes shrink strictly as the density grows from one to three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_densityMonotonicDecrease', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let first: screenSizeType = deriveScreenSize(1080, 1920, DENSITY_LOW);
      let second: screenSizeType = deriveScreenSize(1080, 1920, DENSITY_FRACTIONAL);
      let third: screenSizeType = deriveScreenSize(1080, 1920, DENSITY_MID);
      let fourth: screenSizeType = deriveScreenSize(1080, 1920, DENSITY_HIGH);
      expect(first.x > second.x).assertTrue();
      expect(second.x > third.x).assertTrue();
      expect(third.x > fourth.x).assertTrue();
      expect(first.y > second.y).assertTrue();
      expect(second.y > third.y).assertTrue();
      expect(third.y > fourth.y).assertTrue();
      expect(fourth.x).assertEqual(360);
    });

    /**
     * @tc.number SUB_GAME2048_DISPLAYMATH_5000
     * @tc.name displayMathZeroWidthSquare5000
     * @tc.desc Verify a 0x0 surface takes the landscape branch and keeps the reference width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displayMath_zeroWidthSquare', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let size: screenSizeType = deriveScreenSize(0, 0, DENSITY_HIGH);
      expect(size.x).assertEqual(250);
      expect(size.y).assertEqual(0);
      expect(size.x > 0).assertTrue();
      expect(size.y === size.x).assertFalse();
      BoardKit.warn('zeroWidthSquare', 'degenerate surface clamped by reference width');
    });
  });
}
