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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import display from '@ohos.display';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import Logger from '../../utils/Logger';
import {
  BUNDLE,
  CANVAS_HEIGHT_PX,
  CANVAS_WIDTH_PX,
  SuiteTag
} from '../common/TestConstant';
import {
  createDriver,
  ensureAppVisible,
  getTopAbility,
  sleep
} from '../common/UiFlowHelper';

const TAG: string = SuiteTag.DISPLAY;

const KNOWN_DENSITIES: Array<number> = [120, 160, 240, 320, 480, 640];

async function topWindow(): Promise<window.Window | null> {
  const ability: UIAbility | null = await getTopAbility();
  if (ability === null) {
    return null;
  }
  try {
    return await window.getTopWindow(ability.context);
  } catch (error) {
    return null;
  }
}

/**
 * Display and window contract around the two fixed size canvases. The suites
 * proves that the hosting display is large enough for the page and that the
 * window keeps the default non immersive flags the page relies on.
 */
export default function displayWindowTest(): void {
  describe('LottieDisplayWindowTest', (): void => {
    let driver: Driver;

    beforeAll(async (): Promise<void> => {
      driver = await createDriver();
      await ensureAppVisible(driver);
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_DISPLAY_0100
     * @tc.name defaultDisplayIdentity001
     * @tc.desc Verify the default display resolves with a non-negative id and an alive state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'defaultDisplayIdentity_001', 0, async (): Promise<void> => {
      Logger.info(TAG, 'defaultDisplayIdentity_001 begin');
      const target: display.Display = display.getDefaultDisplaySync();
      const check01: boolean = target.id >= 0;
      Logger.info(TAG, 'defaultDisplayIdentity_001, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = target.alive;
      Logger.info(TAG, 'defaultDisplayIdentity_001, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'defaultDisplayIdentity_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_DISPLAY_0200
     * @tc.name displayFitsBothCanvases002
     * @tc.desc Verify the display is at least as large as one declared canvas
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'displayFitsBothCanvases_002', 0, async (): Promise<void> => {
      Logger.info(TAG, 'displayFitsBothCanvases_002 begin');
      const target: display.Display = display.getDefaultDisplaySync();
      const check01: boolean = target.width >= CANVAS_WIDTH_PX;
      Logger.info(TAG, 'displayFitsBothCanvases_002, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = target.height >= CANVAS_HEIGHT_PX;
      Logger.info(TAG, 'displayFitsBothCanvases_002, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'displayFitsBothCanvases_002 end, ' + target.width + 'x' + target.height);
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_DISPLAY_0300
     * @tc.name displayDensityValid003
     * @tc.desc Verify the display reports a supported density in dots per inch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'displayDensityValid_003', 0, async (): Promise<void> => {
      Logger.info(TAG, 'displayDensityValid_003 begin');
      const target: display.Display = display.getDefaultDisplaySync();
      const check01: boolean = KNOWN_DENSITIES.indexOf(target.densityDPI) >= 0;
      Logger.info(TAG, 'displayDensityValid_003, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = target.densityPixels > 0;
      Logger.info(TAG, 'displayDensityValid_003, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'displayDensityValid_003 end, dpi=' + target.densityDPI);
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_DISPLAY_0400
     * @tc.name densityPixelsMatchDpi004
     * @tc.desc Verify the pixel density is the dots per inch value divided by the baseline 160
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'densityPixelsMatchDpi_004', 0, async (): Promise<void> => {
      Logger.info(TAG, 'densityPixelsMatchDpi_004 begin');
      const target: display.Display = display.getDefaultDisplaySync();
      const derived: number = target.densityDPI / 160;
      const check01: boolean = Math.abs(target.densityPixels - derived) < 0.5;
      Logger.info(TAG, 'densityPixelsMatchDpi_004, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'densityPixelsMatchDpi_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_DISPLAY_0500
     * @tc.name scaledDensityPositive005
     * @tc.desc Verify the scaled density used for font sizing is positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'scaledDensityPositive_005', 0, async (): Promise<void> => {
      Logger.info(TAG, 'scaledDensityPositive_005 begin');
      const target: display.Display = display.getDefaultDisplaySync();
      const check01: boolean = target.scaledDensity > 0;
      Logger.info(TAG, 'scaledDensityPositive_005, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'scaledDensityPositive_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_DISPLAY_0600
     * @tc.name physicalDpiPositive006
     * @tc.desc Verify both physical dots per inch axes report a positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'physicalDpiPositive_006', 0, async (): Promise<void> => {
      Logger.info(TAG, 'physicalDpiPositive_006 begin');
      const target: display.Display = display.getDefaultDisplaySync();
      const check01: boolean = target.xDPI > 0;
      Logger.info(TAG, 'physicalDpiPositive_006, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = target.yDPI > 0;
      Logger.info(TAG, 'physicalDpiPositive_006, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'physicalDpiPositive_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_DISPLAY_0700
     * @tc.name refreshRatePositive007
     * @tc.desc Verify the display reports a positive refresh rate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'refreshRatePositive_007', 0, async (): Promise<void> => {
      Logger.info(TAG, 'refreshRatePositive_007 begin');
      const target: display.Display = display.getDefaultDisplaySync();
      const check01: boolean = target.refreshRate > 0;
      Logger.info(TAG, 'refreshRatePositive_007, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'refreshRatePositive_007 end, rate=' + target.refreshRate);
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_DISPLAY_0800
     * @tc.name rotationWithinContract008
     * @tc.desc Verify the display rotation is one of the four documented values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'rotationWithinContract_008', 0, async (): Promise<void> => {
      Logger.info(TAG, 'rotationWithinContract_008 begin');
      const target: display.Display = display.getDefaultDisplaySync();
      const legal: boolean = target.rotation === 0 || target.rotation === 90 ||
        target.rotation === 180 || target.rotation === 270;
      const check01: boolean = legal;
      Logger.info(TAG, 'rotationWithinContract_008, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'rotationWithinContract_008 end, rotation=' + target.rotation);
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_DISPLAY_0900
     * @tc.name displayStateWithinContract009
     * @tc.desc Verify the display state is one of the documented values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'displayStateWithinContract_009', 0, async (): Promise<void> => {
      Logger.info(TAG, 'displayStateWithinContract_009 begin');
      const target: display.Display = display.getDefaultDisplaySync();
      const check01: boolean = target.state >= 0 && target.state <= 6;
      Logger.info(TAG, 'displayStateWithinContract_009, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'displayStateWithinContract_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_DISPLAY_1000
     * @tc.name repeatedDisplayReadsStable010
     * @tc.desc Verify repeated display reads return the same geometry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'repeatedDisplayReadsStable_010', 0, async (): Promise<void> => {
      Logger.info(TAG, 'repeatedDisplayReadsStable_010 begin');
      const first: display.Display = display.getDefaultDisplaySync();
      const second: display.Display = display.getDefaultDisplaySync();
      const check01: number = first.id;
      Logger.info(TAG, 'repeatedDisplayReadsStable_010, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual(second.id);
      const check02: number = first.width;
      Logger.info(TAG, 'repeatedDisplayReadsStable_010, check02=' + JSON.stringify(check02));
      expect(check02).assertEqual(second.width);
      const check03: number = first.height;
      Logger.info(TAG, 'repeatedDisplayReadsStable_010, check03=' + JSON.stringify(check03));
      expect(check03).assertEqual(second.height);
      Logger.info(TAG, 'repeatedDisplayReadsStable_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_DISPLAY_1100
     * @tc.name topWindowResolvable011
     * @tc.desc Verify the window of the sample ability can be resolved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'topWindowResolvable_011', 0, async (): Promise<void> => {
      Logger.info(TAG, 'topWindowResolvable_011 begin');
      const win: window.Window | null = await topWindow();
      const check01: boolean = win !== null;
      Logger.info(TAG, 'topWindowResolvable_011, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'topWindowResolvable_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_DISPLAY_1200
     * @tc.name windowIdAndRectPositive012
     * @tc.desc Verify the window has a non-negative id and a positive rectangle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'windowIdAndRectPositive_012', 0, async (): Promise<void> => {
      Logger.info(TAG, 'windowIdAndRectPositive_012 begin');
      const win: window.Window | null = await topWindow();
      const check01: boolean = win !== null;
      Logger.info(TAG, 'windowIdAndRectPositive_012, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (win === null) {
        return;
      }
      const properties: window.WindowProperties = win.getWindowProperties();
      const check02: boolean = properties.id >= 0;
      Logger.info(TAG, 'windowIdAndRectPositive_012, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = properties.windowRect.width > 0;
      Logger.info(TAG, 'windowIdAndRectPositive_012, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      const check04: boolean = properties.windowRect.height > 0;
      Logger.info(TAG, 'windowIdAndRectPositive_012, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      Logger.info(TAG, 'windowIdAndRectPositive_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_DISPLAY_1300
     * @tc.name windowTypeIsApplication013
     * @tc.desc Verify the resolved window is an application window
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'windowTypeIsApplication_013', 0, async (): Promise<void> => {
      Logger.info(TAG, 'windowTypeIsApplication_013 begin');
      const win: window.Window | null = await topWindow();
      const check01: boolean = win !== null;
      Logger.info(TAG, 'windowTypeIsApplication_013, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (win === null) {
        return;
      }
      const properties: window.WindowProperties = win.getWindowProperties();
      const check02: number = properties.type;
      Logger.info(TAG, 'windowTypeIsApplication_013, check02=' + JSON.stringify(check02));
      expect(check02).assertEqual(1);
      Logger.info(TAG, 'windowTypeIsApplication_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_DISPLAY_1400
     * @tc.name windowNotFullScreen014
     * @tc.desc Verify the page does not run in full screen or immersive layout mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'windowNotFullScreen_014', 0, async (): Promise<void> => {
      Logger.info(TAG, 'windowNotFullScreen_014 begin');
      const win: window.Window | null = await topWindow();
      const check01: boolean = win !== null;
      Logger.info(TAG, 'windowNotFullScreen_014, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (win === null) {
        return;
      }
      const properties: window.WindowProperties = win.getWindowProperties();
      const check02: boolean = properties.isFullScreen;
      Logger.info(TAG, 'windowNotFullScreen_014, check02=' + JSON.stringify(check02));
      expect(check02).assertFalse();
      const check03: boolean = properties.isLayoutFullScreen;
      Logger.info(TAG, 'windowNotFullScreen_014, check03=' + JSON.stringify(check03));
      expect(check03).assertFalse();
      Logger.info(TAG, 'windowNotFullScreen_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_DISPLAY_1500
     * @tc.name windowFocusable015
     * @tc.desc Verify the application window can gain focus
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'windowFocusable_015', 0, async (): Promise<void> => {
      Logger.info(TAG, 'windowFocusable_015 begin');
      const win: window.Window | null = await topWindow();
      const check01: boolean = win !== null;
      Logger.info(TAG, 'windowFocusable_015, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (win === null) {
        return;
      }
      const properties: window.WindowProperties = win.getWindowProperties();
      const check02: boolean = properties.focusable;
      Logger.info(TAG, 'windowFocusable_015, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'windowFocusable_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_DISPLAY_1600
     * @tc.name windowDefaultFlags016
     * @tc.desc Verify the window keeps the default screen, privacy and transparency flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'windowDefaultFlags_016', 0, async (): Promise<void> => {
      Logger.info(TAG, 'windowDefaultFlags_016 begin');
      const win: window.Window | null = await topWindow();
      const check01: boolean = win !== null;
      Logger.info(TAG, 'windowDefaultFlags_016, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (win === null) {
        return;
      }
      const properties: window.WindowProperties = win.getWindowProperties();
      const check02: boolean = properties.isKeepScreenOn;
      Logger.info(TAG, 'windowDefaultFlags_016, check02=' + JSON.stringify(check02));
      expect(check02).assertFalse();
      const check03: boolean = properties.isPrivacyMode;
      Logger.info(TAG, 'windowDefaultFlags_016, check03=' + JSON.stringify(check03));
      expect(check03).assertFalse();
      const check04: boolean = properties.isTransparent;
      Logger.info(TAG, 'windowDefaultFlags_016, check04=' + JSON.stringify(check04));
      expect(check04).assertFalse();
      Logger.info(TAG, 'windowDefaultFlags_016 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_DISPLAY_1700
     * @tc.name windowBrightness017
     * @tc.desc Verify the window brightness is either the follow system value or a normalized level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'windowBrightness_017', 0, async (): Promise<void> => {
      Logger.info(TAG, 'windowBrightness_017 begin');
      const win: window.Window | null = await topWindow();
      const check01: boolean = win !== null;
      Logger.info(TAG, 'windowBrightness_017, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (win === null) {
        return;
      }
      const properties: window.WindowProperties = win.getWindowProperties();
      const check02: boolean = properties.brightness >= -1 && properties.brightness <= 1;
      Logger.info(TAG, 'windowBrightness_017, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'windowBrightness_017 end, brightness=' + properties.brightness);
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_DISPLAY_1800
     * @tc.name windowRectWithinDisplay018
     * @tc.desc Verify the application window does not exceed the display bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'windowRectWithinDisplay_018', 0, async (): Promise<void> => {
      Logger.info(TAG, 'windowRectWithinDisplay_018 begin');
      const win: window.Window | null = await topWindow();
      const check01: boolean = win !== null;
      Logger.info(TAG, 'windowRectWithinDisplay_018, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (win === null) {
        return;
      }
      const properties: window.WindowProperties = win.getWindowProperties();
      const target: display.Display = display.getDefaultDisplaySync();
      const check02: boolean = properties.windowRect.width <= target.width;
      Logger.info(TAG, 'windowRectWithinDisplay_018, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = properties.windowRect.height <= target.height;
      Logger.info(TAG, 'windowRectWithinDisplay_018, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      Logger.info(TAG, 'windowRectWithinDisplay_018 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_DISPLAY_1900
     * @tc.name systemAvoidAreaRects019
     * @tc.desc Verify the system avoid area exposes four non-negative rectangles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'systemAvoidAreaRects_019', 0, async (): Promise<void> => {
      Logger.info(TAG, 'systemAvoidAreaRects_019 begin');
      const win: window.Window | null = await topWindow();
      const check01: boolean = win !== null;
      Logger.info(TAG, 'systemAvoidAreaRects_019, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (win === null) {
        return;
      }
      const area: window.AvoidArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
      const check02: boolean = area.topRect.width >= 0;
      Logger.info(TAG, 'systemAvoidAreaRects_019, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = area.topRect.height >= 0;
      Logger.info(TAG, 'systemAvoidAreaRects_019, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      const check04: boolean = area.bottomRect.width >= 0;
      Logger.info(TAG, 'systemAvoidAreaRects_019, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      const check05: boolean = area.bottomRect.height >= 0;
      Logger.info(TAG, 'systemAvoidAreaRects_019, check05=' + JSON.stringify(check05));
      expect(check05).assertTrue();
      const check06: boolean = area.leftRect.width >= 0;
      Logger.info(TAG, 'systemAvoidAreaRects_019, check06=' + JSON.stringify(check06));
      expect(check06).assertTrue();
      const check07: boolean = area.rightRect.width >= 0;
      Logger.info(TAG, 'systemAvoidAreaRects_019, check07=' + JSON.stringify(check07));
      expect(check07).assertTrue();
      Logger.info(TAG, 'systemAvoidAreaRects_019 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_DISPLAY_2000
     * @tc.name lastWindowMatchesTop020
     * @tc.desc Verify the last window of the ability process matches the top window
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'lastWindowMatchesTop_020', 0, async (): Promise<void> => {
      Logger.info(TAG, 'lastWindowMatchesTop_020 begin');
      const ability: UIAbility | null = await getTopAbility();
      const check01: boolean = ability !== null;
      Logger.info(TAG, 'lastWindowMatchesTop_020, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (ability === null) {
        return;
      }
      const top: window.Window | null = await topWindow();
      const check02: boolean = top !== null;
      Logger.info(TAG, 'lastWindowMatchesTop_020, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      if (top === null) {
        return;
      }
      const last: window.Window = await window.getLastWindow(ability.context);
      const check03: number = top.getWindowProperties().id;
      Logger.info(TAG, 'lastWindowMatchesTop_020, check03=' + JSON.stringify(check03));
      expect(check03).assertEqual(last.getWindowProperties().id);
      Logger.info(TAG, 'lastWindowMatchesTop_020 end');
    });
  });
}
