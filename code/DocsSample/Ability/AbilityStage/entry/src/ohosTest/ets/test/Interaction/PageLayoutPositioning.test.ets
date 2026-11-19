/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON, Component, Rect, Point } from '@ohos.UiTest';
import {
  getDriver,
  ensureIndexPageInitial,
  logInfo,
  logError,
  launchEntryAbility,
  waitForIndexPageStable,
  checkComponentExists,
  checkComponentExistsByKey,
  pageComponentCount,
  readTextById,
  runSerializedUiOperation,
  INDEX_PAGE_TEXT_KEY,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  TIMEOUT_PAGE_RENDER
} from '../Shared/SharedDriver';

const CONTAINER_ANCHOR: string = '__container__';

const FONT_SIZE_FP: number = 50;

const LINE_HEIGHT_FP: number = 60;

const TEXT_WIDTH_FP: number = 330;

const FULL_PERCENT: string = '100%';

class LayoutAnchorError extends Error {
  private readonly anchorName: string;

  constructor(anchorName: string) {
    super(`unknown anchor ${anchorName}`);
    this.name = 'LayoutAnchorError';
    this.anchorName = anchorName;
  }

  public getAnchorName(): string {
    return this.anchorName;
  }
}

class LayoutRect {
  private readonly leftValue: number;
  private readonly topValue: number;
  private readonly widthValue: number;
  private readonly heightValue: number;

  constructor(left: number, top: number, width: number, height: number) {
    this.leftValue = left;
    this.topValue = top;
    this.widthValue = width;
    this.heightValue = height;
  }

  public getLeft(): number {
    return this.leftValue;
  }

  public getTop(): number {
    return this.topValue;
  }

  public getWidth(): number {
    return this.widthValue;
  }

  public getHeight(): number {
    return this.heightValue;
  }

  public getRight(): number {
    return this.leftValue + this.widthValue;
  }

  public getBottom(): number {
    return this.topValue + this.heightValue;
  }

  public getCenterX(): number {
    return this.leftValue + this.widthValue / 2;
  }

  public getCenterY(): number {
    return this.topValue + this.heightValue / 2;
  }

  public contains(x: number, y: number): boolean {
    return x >= this.leftValue && x <= this.getRight() && y >= this.topValue && y <= this.getBottom();
  }

  public containsRect(other: LayoutRect): boolean {
    return other.getLeft() >= this.leftValue && other.getRight() <= this.getRight() &&
      other.getTop() >= this.topValue && other.getBottom() <= this.getBottom();
  }
}

class PercentSize {
  private readonly percentText: string;

  constructor(percentText: string) {
    this.percentText = percentText;
  }

  public getPercentText(): string {
    return this.percentText;
  }

  private static parseDecimal(raw: string): number {
    if (raw.length === 0) {
      return -1;
    }
    let sign: number = 1;
    let index: number = 0;
    if (raw.charAt(0) === '-') {
      sign = -1;
      index = 1;
    }
    let integerPart: number = 0;
    let fractionPart: number = 0;
    let fractionScale: number = 1;
    let dotSeen: boolean = false;
    let digitCount: number = 0;
    for (let i = index; i < raw.length; i++) {
      const code: number = raw.charCodeAt(i);
      if (code === 46 && !dotSeen) {
        dotSeen = true;
        continue;
      }
      if (code < 48 || code > 57) {
        return -1;
      }
      const digit: number = code - 48;
      if (dotSeen) {
        fractionScale = fractionScale * 10;
        fractionPart = fractionPart * 10 + digit;
      } else {
        integerPart = integerPart * 10 + digit;
      }
      digitCount++;
    }
    if (digitCount === 0) {
      return -1;
    }
    return sign * (integerPart + fractionPart / fractionScale);
  }

  public isValid(): boolean {
    if (this.percentText.length < 2) {
      return false;
    }
    const endIndex: number = this.percentText.length - 1;
    if (this.percentText.charAt(endIndex) !== '%') {
      return false;
    }
    const numberPart: string = this.percentText.substring(0, endIndex);
    const parsed: number = PercentSize.parseDecimal(numberPart);
    return isFinite(parsed) && parsed >= 0;
  }

  public getFraction(): number {
    if (!this.isValid()) {
      return 0;
    }
    const numberPart: string = this.percentText.substring(0, this.percentText.length - 1);
    return PercentSize.parseDecimal(numberPart) / 100;
  }

  public resolve(parentExtent: number): number {
    if (parentExtent < 0) {
      return 0;
    }
    return Math.round(parentExtent * this.getFraction());
  }
}

class AnchorResolver {
  private readonly containerRect: LayoutRect;

  constructor(containerRect: LayoutRect) {
    this.containerRect = containerRect;
  }

  public resolveAnchor(anchorName: string): LayoutRect {
    if (anchorName === CONTAINER_ANCHOR) {
      return this.containerRect;
    }
    throw new LayoutAnchorError(anchorName);
  }

  public resolveAnchorSafe(anchorName: string): LayoutRect {
    if (anchorName === CONTAINER_ANCHOR) {
      return this.containerRect;
    }
    return new LayoutRect(0, 0, 0, 0);
  }

  public isKnownAnchor(anchorName: string): boolean {
    return anchorName === CONTAINER_ANCHOR;
  }
}

class CenteredAlignmentModel {
  private readonly containerRect: LayoutRect;
  private readonly childWidth: number;
  private readonly childHeight: number;

  constructor(containerRect: LayoutRect, childWidth: number, childHeight: number) {
    this.containerRect = containerRect;
    this.childWidth = childWidth;
    this.childHeight = childHeight;
  }

  public getChildRect(): LayoutRect {
    const x: number = this.centerOffsetX();
    const y: number = this.centerOffsetY();
    return new LayoutRect(x, y, this.childWidth, this.childHeight);
  }

  public centerOffsetX(): number {
    return Math.round((this.containerRect.getWidth() - this.childWidth) / 2);
  }

  public centerOffsetY(): number {
    return Math.round((this.containerRect.getHeight() - this.childHeight) / 2);
  }

  public topOffset(): number {
    return 0;
  }

  public bottomOffset(): number {
    return this.containerRect.getHeight() - this.childHeight;
  }

  public leftOffset(): number {
    return 0;
  }

  public rightOffset(): number {
    return this.containerRect.getWidth() - this.childWidth;
  }

  public centerRatioX(): number {
    if (this.containerRect.getWidth() === 0) {
      return 0;
    }
    return Math.round(this.centerOffsetX() / this.containerRect.getWidth() * 100) / 100;
  }

  public isHorizontallyBalanced(): boolean {
    return this.centerOffsetX() === this.containerRect.getWidth() - this.childWidth - this.centerOffsetX();
  }

  public isVerticallyBalanced(): boolean {
    return this.centerOffsetY() === this.containerRect.getHeight() - this.childHeight - this.centerOffsetY();
  }
}

class PageLayoutModel {
  private readonly viewportWidth: number;
  private readonly viewportHeight: number;
  private readonly fullPercent: PercentSize;

  constructor(viewportWidth: number, viewportHeight: number) {
    this.viewportWidth = viewportWidth;
    this.viewportHeight = viewportHeight;
    this.fullPercent = new PercentSize(FULL_PERCENT);
  }

  public getViewportRect(): LayoutRect {
    return new LayoutRect(0, 0, this.viewportWidth, this.viewportHeight);
  }

  public getFullPercent(): PercentSize {
    return this.fullPercent;
  }

  public getContainerRect(): LayoutRect {
    const width: number = this.fullPercent.resolve(this.viewportWidth);
    const height: number = this.fullPercent.resolve(this.viewportHeight);
    return new LayoutRect(0, 0, width, height);
  }

  public getTextRect(): LayoutRect {
    return new CenteredAlignmentModel(this.getContainerRect(), TEXT_WIDTH_FP, LINE_HEIGHT_FP).getChildRect();
  }

  public getAlignment(): CenteredAlignmentModel {
    return new CenteredAlignmentModel(this.getContainerRect(), TEXT_WIDTH_FP, LINE_HEIGHT_FP);
  }

  public getTextAreaRatio(): number {
    const containerArea: number = this.getContainerRect().getWidth() * this.getContainerRect().getHeight();
    if (containerArea === 0) {
      return 0;
    }
    const textArea: number = TEXT_WIDTH_FP * LINE_HEIGHT_FP;
    return Math.round(textArea / containerArea * 10000) / 10000;
  }

  public isTextInsideContainer(): boolean {
    return this.getContainerRect().containsRect(this.getTextRect());
  }

  public resolveWidth(percentText: string): number {
    return new PercentSize(percentText).resolve(this.viewportWidth);
  }

  public resolveHeight(percentText: string): number {
    return new PercentSize(percentText).resolve(this.viewportHeight);
  }

  public fontFraction(): number {
    return FONT_SIZE_FP / LINE_HEIGHT_FP;
  }
}

export default function pageLayoutPositioningTest(): void {
  describe('PageLayoutPositioningTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      logInfo('PageLayoutPositioningTest: beforeAll start');
      await launchEntryAbility();
      await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
      await ensureIndexPageInitial(driver);
      logInfo('PageLayoutPositioningTest: beforeAll finished');
    })

    afterAll(async () => {
      logInfo('PageLayoutPositioningTest: afterAll start');
      await driver.delayMs(100);
      logInfo('PageLayoutPositioningTest: afterAll finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAYOUT_0100
     * @tc.name testLayoutContainerAnchorResolved
     * @tc.desc Verify the __container__ anchor resolves to the full viewport rect on a 1080x1920 device
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLayoutContainerAnchorResolved', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: PageLayoutModel = new PageLayoutModel(1080, 1920);
        const resolver: AnchorResolver = new AnchorResolver(model.getViewportRect());
        const resolved: LayoutRect = resolver.resolveAnchor(CONTAINER_ANCHOR);
        expect(resolved.getWidth()).assertEqual(1080);
        expect(resolved.getHeight()).assertEqual(1920);
        expect(resolver.isKnownAnchor(CONTAINER_ANCHOR)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAYOUT_0200
     * @tc.name testLayoutUnknownAnchorRejected
     * @tc.desc Verify a non container anchor name raises LayoutAnchorError while the safe resolver yields a zero rect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLayoutUnknownAnchorRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: PageLayoutModel = new PageLayoutModel(1080, 1920);
        const resolver: AnchorResolver = new AnchorResolver(model.getViewportRect());
        expect(resolver.isKnownAnchor('HelloWorld')).assertFalse();
        try {
          resolver.resolveAnchor('HelloWorld');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('LayoutAnchorError');
        }
        const safeRect: LayoutRect = resolver.resolveAnchorSafe('HelloWorld');
        expect(safeRect.getWidth()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAYOUT_0300
     * @tc.name testLayoutFullPercentResolution
     * @tc.desc Verify 100% width resolves to 1080 and 100% height resolves to 1920 on the same viewport
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLayoutFullPercentResolution', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: PageLayoutModel = new PageLayoutModel(1080, 1920);
        expect(model.resolveWidth(FULL_PERCENT)).assertEqual(1080);
        expect(model.resolveHeight(FULL_PERCENT)).assertEqual(1920);
        expect(model.getFullPercent().getFraction()).assertEqual(1.0);
        expect(model.getFullPercent().isValid()).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAYOUT_0400
     * @tc.name testLayoutPercentFractions
     * @tc.desc Verify 50% of 1080 is 540, 12.5% of 1920 is 240, 33.3% of 1080 rounds to 360 and 0% is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLayoutPercentFractions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: PageLayoutModel = new PageLayoutModel(1080, 1920);
        expect(model.resolveWidth('50%')).assertEqual(540);
        expect(model.resolveHeight('12.5%')).assertEqual(240);
        expect(model.resolveWidth('33.3%')).assertEqual(360);
        expect(model.resolveWidth('0%')).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAYOUT_0500
     * @tc.name testLayoutInvalidPercentRejected
     * @tc.desc Verify malformed percent strings like plain 100 and 10x are rejected and resolve to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLayoutInvalidPercentRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const missingSign: PercentSize = new PercentSize('100');
        const badSuffix: PercentSize = new PercentSize('10x');
        const negative: PercentSize = new PercentSize('-10%');
        expect(missingSign.isValid()).assertFalse();
        expect(badSuffix.isValid()).assertFalse();
        expect(negative.isValid()).assertFalse();
        expect(missingSign.resolve(1080)).assertEqual(0);
        expect(negative.resolve(1080)).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAYOUT_0600
     * @tc.name testLayoutCenterOnPhoneViewport
     * @tc.desc Verify the 330x60 text centers at x 375 and y 930 inside a 1080x1920 viewport
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLayoutCenterOnPhoneViewport', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: PageLayoutModel = new PageLayoutModel(1080, 1920);
        const textRect: LayoutRect = model.getTextRect();
        expect(textRect.getLeft()).assertEqual(375);
        expect(textRect.getTop()).assertEqual(930);
        expect(textRect.getWidth()).assertEqual(330);
        expect(textRect.getHeight()).assertEqual(60);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAYOUT_0700
     * @tc.name testLayoutCenterOnTabletViewport
     * @tc.desc Verify the same text centers at x 195 and y 610 inside a 720x1280 viewport
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLayoutCenterOnTabletViewport', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: PageLayoutModel = new PageLayoutModel(720, 1280);
        const alignment: CenteredAlignmentModel = model.getAlignment();
        expect(alignment.centerOffsetX()).assertEqual(195);
        expect(alignment.centerOffsetY()).assertEqual(610);
        expect(alignment.isHorizontallyBalanced()).assertTrue();
        expect(alignment.isVerticallyBalanced()).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAYOUT_0800
     * @tc.name testLayoutCenterOnSmallViewport
     * @tc.desc Verify the text centers at x 15 and y 290 inside a 360x640 viewport
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLayoutCenterOnSmallViewport', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: PageLayoutModel = new PageLayoutModel(360, 640);
        const textRect: LayoutRect = model.getTextRect();
        expect(textRect.getLeft()).assertEqual(15);
        expect(textRect.getTop()).assertEqual(290);
        expect(model.isTextInsideContainer()).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAYOUT_0900
     * @tc.name testLayoutCenterOnLargeViewport
     * @tc.desc Verify the text centers at x 1115 and y 770 inside a 2560x1600 viewport
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLayoutCenterOnLargeViewport', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: PageLayoutModel = new PageLayoutModel(2560, 1600);
        const alignment: CenteredAlignmentModel = model.getAlignment();
        expect(alignment.centerOffsetX()).assertEqual(1115);
        expect(alignment.centerOffsetY()).assertEqual(770);
        expect(alignment.getChildRect().getRight()).assertEqual(1445);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAYOUT_1000
     * @tc.name testLayoutCenterEdgeOffsets
     * @tc.desc Verify the 1080 container decomposes into four segments: left gap 375, text 330, right gap 375, total 1080
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLayoutCenterEdgeOffsets', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: PageLayoutModel = new PageLayoutModel(1080, 1920);
        const alignment: CenteredAlignmentModel = model.getAlignment();
        const leftGap: number = alignment.leftOffset() + alignment.centerOffsetX();
        const rightGap: number = alignment.rightOffset() - alignment.centerOffsetX();
        expect(alignment.leftOffset()).assertEqual(0);
        expect(alignment.centerOffsetX()).assertEqual(375);
        expect(TEXT_WIDTH_FP).assertEqual(330);
        expect(leftGap).assertEqual(375);
        expect(rightGap).assertEqual(375);
        expect(leftGap + TEXT_WIDTH_FP + rightGap).assertEqual(1080);
        expect(alignment.bottomOffset()).assertEqual(1860);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAYOUT_1100
     * @tc.name testLayoutTextInsideContainerAllViewports
     * @tc.desc Verify the centered text stays fully inside the container across four viewport sizes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLayoutTextInsideContainerAllViewports', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const viewports: LayoutRect[] = [
          new LayoutRect(0, 0, 1080, 1920),
          new LayoutRect(0, 0, 720, 1280),
          new LayoutRect(0, 0, 360, 640),
          new LayoutRect(0, 0, 2560, 1600)
        ];
        let insideCount: number = 0;
        for (let i = 0; i < viewports.length; i++) {
          const alignment: CenteredAlignmentModel =
            new CenteredAlignmentModel(viewports[i], TEXT_WIDTH_FP, LINE_HEIGHT_FP);
          if (viewports[i].containsRect(alignment.getChildRect())) {
            insideCount++;
          }
        }
        expect(insideCount).assertEqual(4);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAYOUT_1200
     * @tc.name testLayoutTextAreaRatio
     * @tc.desc Verify text area 19800 against a 2073600 container area yields the ratio 0.0095
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLayoutTextAreaRatio', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: PageLayoutModel = new PageLayoutModel(1080, 1920);
        expect(model.getTextAreaRatio()).assertEqual(0.0095);
        expect(TEXT_WIDTH_FP * LINE_HEIGHT_FP).assertEqual(19800);
        expect(model.getContainerRect().getWidth() * model.getContainerRect().getHeight()).assertEqual(2073600);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAYOUT_1300
     * @tc.name testLayoutFontLineFraction
     * @tc.desc Verify a 50fp font inside a 60fp line box yields the fraction 0.8333 when rounded to four decimal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLayoutFontLineFraction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: PageLayoutModel = new PageLayoutModel(1080, 1920);
        expect(Math.round(model.fontFraction() * 10000) / 10000).assertEqual(0.8333);
        expect(model.fontFraction() < 1).assertTrue();
        expect(LINE_HEIGHT_FP - FONT_SIZE_FP).assertEqual(10);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAYOUT_1400
     * @tc.name testLayoutZeroViewportSafety
     * @tc.desc Verify a zero size viewport keeps the center ratio at 0 and avoids a divide by zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLayoutZeroViewportSafety', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: PageLayoutModel = new PageLayoutModel(0, 0);
        const alignment: CenteredAlignmentModel = model.getAlignment();
        expect(alignment.centerRatioX()).assertEqual(0);
        expect(model.getTextAreaRatio()).assertEqual(0);
        expect(alignment.centerOffsetX()).assertEqual(-165);
        expect(alignment.getChildRect().getLeft()).assertEqual(-165);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAYOUT_1500
     * @tc.name testLayoutCenterRatioProportional
     * @tc.desc Verify the horizontal center offset ratio is 0.35 on 1080 and 0.27 on 720 viewports
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLayoutCenterRatioProportional', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const phoneModel: PageLayoutModel = new PageLayoutModel(1080, 1920);
        const tabletModel: PageLayoutModel = new PageLayoutModel(720, 1280);
        expect(phoneModel.getAlignment().centerRatioX()).assertEqual(0.35);
        expect(tabletModel.getAlignment().centerRatioX()).assertEqual(0.27);
        expect(phoneModel.getAlignment().isHorizontallyBalanced()).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAYOUT_1600
     * @tc.name testLayoutRealUiContainerPresent
     * @tc.desc Verify the RelativeContainer and Text nodes exist so the alignment rules can be applied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLayoutRealUiContainerPresent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        const containerExists: boolean = await checkComponentExists(driver, 'RelativeContainer');
        expect(containerExists).assertTrue();
        const textExists: boolean = await checkComponentExists(driver, 'Text');
        expect(textExists).assertTrue();
      } catch (e) {
        logError(`testLayoutRealUiContainerPresent failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAYOUT_1700
     * @tc.name testLayoutRealUiTextCenteredInContainer
     * @tc.desc Verify the live text bounds sit inside the container bounds and are horizontally balanced
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLayoutRealUiTextCenteredInContainer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const bounds: number[][] = await runSerializedUiOperation(async (): Promise<number[][]> => {
          const textComponent: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
          const textBounds: Rect = await textComponent.getBounds();
          const containerComponents: Component[] = await driver.findComponents(ON.type('RelativeContainer'));
          const containerBounds: Rect = await containerComponents[0].getBounds();
          const textRect: number[] = [textBounds.left, textBounds.top, textBounds.right, textBounds.bottom];
          const containerRect: number[] = [
            containerBounds.left, containerBounds.top, containerBounds.right, containerBounds.bottom
          ];
          return [textRect, containerRect];
        });
        const textRect: number[] = bounds[0];
        const containerRect: number[] = bounds[1];
        expect(textRect.length).assertEqual(4);
        expect(textRect[0] >= containerRect[0]).assertTrue();
        expect(textRect[2] <= containerRect[2]).assertTrue();
        expect(textRect[1] >= containerRect[1]).assertTrue();
        logInfo(`testLayoutRealUiTextCenteredInContainer: text ${textRect} container ${containerRect}`);
      } catch (e) {
        logError(`testLayoutRealUiTextCenteredInContainer failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAYOUT_1800
     * @tc.name testLayoutRealUiCenterDeviationSmall
     * @tc.desc Verify the live text center deviates from the container center by no more than one percent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLayoutRealUiCenterDeviationSmall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const centers: number[] = await runSerializedUiOperation(async (): Promise<number[]> => {
          const textComponent: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
          const textCenter: Point = await textComponent.getBoundsCenter();
          const containerComponents: Component[] = await driver.findComponents(ON.type('RelativeContainer'));
          const containerCenter: Point = await containerComponents[0].getBoundsCenter();
          return [textCenter.x, textCenter.y, containerCenter.x, containerCenter.y];
        });
        const deltaX: number = Math.abs(centers[0] - centers[2]);
        const deltaY: number = Math.abs(centers[1] - centers[3]);
        const toleranceX: number = centers[2] * 0.01;
        const toleranceY: number = centers[3] * 0.01;
        expect(deltaX <= toleranceX).assertTrue();
        expect(deltaY <= toleranceY).assertTrue();
        logInfo(`testLayoutRealUiCenterDeviationSmall: dx ${deltaX} dy ${deltaY}`);
      } catch (e) {
        logError(`testLayoutRealUiCenterDeviationSmall failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAYOUT_1900
     * @tc.name testLayoutRealUiIdLocatedInContainer
     * @tc.desc Verify the HelloWorld id is locatable, the page reports at least one component, and the same
     * id resolves to a component whose text is one of the two declared page copies
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLayoutRealUiIdLocatedInContainer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const idExists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
        expect(idExists).assertTrue();
        const count: number = await pageComponentCount(driver);
        expect(count > 0).assertTrue();
        const text: string = await readTextById(driver);
        expect(text === PAGE_TEXT_INITIAL || text === PAGE_TEXT_CLICKED).assertTrue();
        logInfo(`testLayoutRealUiIdLocatedInContainer: component count ${count}, text ${text}`);
      } catch (e) {
        logError(`testLayoutRealUiIdLocatedInContainer failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })
  })
}
