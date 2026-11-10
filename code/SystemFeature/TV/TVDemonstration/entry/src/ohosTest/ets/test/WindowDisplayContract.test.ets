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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import { Component, DisplayRotation, Driver, ON, Rect } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { common, UIAbility } from '@kit.AbilityKit';
import { display, router, window } from '@kit.ArkUI';
import { KeyCode } from '@kit.InputKit';
import { calculateScreenDiagonalInches } from './DisplayDiagonalPolicy';
import { startAppWithRetry } from './TestScenarioUtils';


const WINDOW_DISPLAY_CONTRACT_WANT: Want = {
  bundleName: 'com.sample.demonstration',
  abilityName: 'EntryAbility'
};

async function launchEntryAbilityContext(): Promise<common.UIAbilityContext> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  await startAppWithRetry(WINDOW_DISPLAY_CONTRACT_WANT, 'com.sample.demonstration');
  const ability: UIAbility = await delegator.getCurrentTopAbility();
  return ability.context;
}

async function restoreRouterRoot(driver: Driver): Promise<void> {
  let state: router.RouterState = router.getState();
  while (state.index > 1) {
    router.back();
    await driver.delayMs(180);
    state = router.getState();
  }
  await driver.assertComponentExist(ON.id('tab0'));
}

async function getMainWindow(context: common.UIAbilityContext): Promise<window.Window> {
  return window.getLastWindow(context);
}

export default function windowDisplayContractTest(): void {
  describe('MainWindowContractTest', () => {
    let driver: Driver;
    let context: common.UIAbilityContext;

    beforeAll(async (): Promise<void> => {
      context = await launchEntryAbilityContext();
      driver = Driver.create();
      await driver.delayMs(500);
      await restoreRouterRoot(driver);
    });

    beforeEach(async (): Promise<void> => {
      await restoreRouterRoot(driver);
    });

    afterEach(async (): Promise<void> => {
      await restoreRouterRoot(driver);
    });

    afterAll(async (): Promise<void> => {
      await restoreRouterRoot(driver);
      await driver.pressHome();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MAIN_WINDOW_0100
     * @tc.name mainWindowDisplayGeometry003
     * @tc.desc Verify WindowProperties rectangle is positive and contained by the default display
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mainWindowDisplayGeometry003', 0, async (): Promise<void> => {
      const properties: window.WindowProperties = (await getMainWindow(context)).getWindowProperties();
      const screen: display.Display = display.getDefaultDisplaySync();
      expect(properties.windowRect.left + properties.windowRect.width <= screen.width).assertTrue();
      expect(properties.windowRect.top + properties.windowRect.height <= screen.height).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MAIN_WINDOW_0200
     * @tc.name mainWindowUiTreeContainment004
     * @tc.desc Verify ProductSpecPage title bounds stay inside the actual WindowProperties rectangle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mainWindowUiTreeContainment004', 0, async (): Promise<void> => {
      const properties: window.WindowProperties = (await getMainWindow(context)).getWindowProperties();
      const title: Component = await driver.findComponent(ON.text('Product Specifications'));
      const bounds: Rect = await title.getBounds();
      expect(bounds.left >= properties.windowRect.left).assertTrue();
      expect(bounds.top >= properties.windowRect.top).assertTrue();
      expect(bounds.right <= properties.windowRect.left + properties.windowRect.width).assertTrue();
      expect(bounds.bottom <= properties.windowRect.top + properties.windowRect.height).assertTrue();
    });



    /**
     * @tc.number SUB_TV_DEMONSTRATION_MAIN_WINDOW_0500
     * @tc.name mainWindowHomeForegroundRecovery008
     * @tc.desc Verify EntryAbility foreground restoration keeps the same main window identity and usable UI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mainWindowHomeForegroundRecovery008', 0, async (): Promise<void> => {
      const beforeId: number = (await getMainWindow(context)).getWindowProperties().id;
      await driver.pressHome();
      await driver.delayMs(220);
      await startAppWithRetry(WINDOW_DISPLAY_CONTRACT_WANT, 'com.sample.demonstration');
      await driver.delayMs(420);
      const restoredWindow: window.Window = await getMainWindow(context);
      expect(restoredWindow.getWindowProperties().id).assertEqual(beforeId);
      expect(restoredWindow.isFocused()).assertTrue();
      await driver.assertComponentExist(ON.id('tab0'));
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MAIN_WINDOW_0600
     * @tc.name mainWindowScreenSaverSecurityBoundary009
     * @tc.desc Verify WindowProperties allows idle ScreenSaver and does not mark the public TV window private
     * @tc.size MediumTest
     * @tc.type Security
     * @tc.level Level 3
     */
    it('mainWindowScreenSaverSecurityBoundary009', 0, async (): Promise<void> => {
      const properties: window.WindowProperties = (await getMainWindow(context)).getWindowProperties();

      // The application implements its own idle ScreenSaver, so forcing the physical display
      // awake would defeat that lifecycle. The public demonstration page also holds no secrets.
      expect(properties.isKeepScreenOn).assertFalse();
      expect(properties.isPrivacyMode).assertFalse();
      expect(properties.brightness >= -1 && properties.brightness <= 1).assertTrue();
    });
  });

  describe('WindowAvoidAreaContractTest', () => {
    let driver: Driver;
    let context: common.UIAbilityContext;

    const expectEmptyTvSystemRect = (rect: window.Rect): void => {
      // A zero reservation rectangle means left == right and top == bottom.
      const right: number = rect.left + rect.width;
      const bottom: number = rect.top + rect.height;
      expect(rect.left).assertEqual(right);
      expect(rect.top).assertEqual(bottom);
    };

    const expectNodeInsideDrawable = (bounds: Rect, properties: window.WindowProperties): void => {
      const drawableLeft: number = properties.windowRect.left + properties.drawableRect.left;
      const drawableTop: number = properties.windowRect.top + properties.drawableRect.top;
      expect(bounds.left >= drawableLeft).assertTrue();
      expect(bounds.top >= drawableTop).assertTrue();
      expect(bounds.right <= drawableLeft + properties.drawableRect.width).assertTrue();
      expect(bounds.bottom <= drawableTop + properties.drawableRect.height).assertTrue();
    };

    beforeAll(async (): Promise<void> => {
      context = await launchEntryAbilityContext();
      driver = Driver.create();
      await driver.delayMs(500);
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
      await restoreRouterRoot(driver);
    });

    beforeEach(async (): Promise<void> => {
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
      await driver.delayMs(160);
      await restoreRouterRoot(driver);
    });

    afterEach(async (): Promise<void> => {
      await restoreRouterRoot(driver);
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
    });

    afterAll(async (): Promise<void> => {
      await restoreRouterRoot(driver);
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
      await driver.pressHome();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_WINDOW_AVOID_0100
     * @tc.name windowAvoidAreaCatalog001
     * @tc.desc Verify getWindowAvoidArea returns bounded rectangles for every supported avoid-area family
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('windowAvoidAreaCatalog001', 0, async (): Promise<void> => {
      const targetWindow: window.Window = await getMainWindow(context);
      const areaTypes: window.AvoidAreaType[] = [
        window.AvoidAreaType.TYPE_SYSTEM, window.AvoidAreaType.TYPE_CUTOUT,
        window.AvoidAreaType.TYPE_SYSTEM_GESTURE, window.AvoidAreaType.TYPE_KEYBOARD,
        window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR
      ];
      for (let index: number = 0; index < areaTypes.length; index++) {
        const area: window.AvoidArea = targetWindow.getWindowAvoidArea(areaTypes[index]);

        // The TV demonstration owns the full panel: no status bar, gesture area, indicator or
        // soft keyboard reserves space, so every system family must report an empty rectangle.
        expectEmptyTvSystemRect(area.leftRect);
        expectEmptyTvSystemRect(area.topRect);
        expectEmptyTvSystemRect(area.rightRect);
        expectEmptyTvSystemRect(area.bottomRect);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_WINDOW_AVOID_0200
     * @tc.name windowDrawableRectangle002
     * @tc.desc Verify WindowProperties drawableRect is positive and contained by the main window rectangle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('windowDrawableRectangle002', 0, async (): Promise<void> => {
      const properties: window.WindowProperties = (await getMainWindow(context)).getWindowProperties();
      expect(properties.drawableRect.left >= 0).assertTrue();
      expect(properties.drawableRect.top >= 0).assertTrue();
      expect(properties.drawableRect.left + properties.drawableRect.width <= properties.windowRect.width).assertTrue();
      expect(properties.drawableRect.top + properties.drawableRect.height <= properties.windowRect.height).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_WINDOW_AVOID_0300
     * @tc.name windowPrimaryTabsInsideDrawable003
     * @tc.desc Verify all Index navigation tabs remain inside the WindowProperties drawableRect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('windowPrimaryTabsInsideDrawable003', 0, async (): Promise<void> => {
      const properties: window.WindowProperties = (await getMainWindow(context)).getWindowProperties();
      for (let index: number = 0; index < 4; index++) {
        const bounds: Rect = await (await driver.findComponent(ON.id('tab' + index.toString()))).getBounds();
        expectNodeInsideDrawable(bounds, properties);
      }
    });



    /**
     * @tc.number SUB_TV_DEMONSTRATION_WINDOW_AVOID_0600
     * @tc.name windowAvoidAreaRotationRecalculation007
     * @tc.desc Verify 90 degree rotation recalculates window geometry and keeps tabs inside drawableRect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('windowAvoidAreaRotationRecalculation007', 0, async (): Promise<void> => {
      const before: window.WindowProperties = (await getMainWindow(context)).getWindowProperties();
      await driver.setDisplayRotation(DisplayRotation.ROTATION_90);
      await driver.delayMs(300);
      const after: window.WindowProperties = (await getMainWindow(context)).getWindowProperties();
      expect(after.windowRect.width !== before.windowRect.width ||
        after.windowRect.height !== before.windowRect.height).assertTrue();
      const tabBounds: Rect = await (await driver.findComponent(ON.id('tab0'))).getBounds();
      expectNodeInsideDrawable(tabBounds, after);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_WINDOW_AVOID_0700
     * @tc.name windowAvoidAreaRouteStability008
     * @tc.desc Verify Media route transitions preserve system avoid-area rectangles for the same main window
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('windowAvoidAreaRouteStability008', 0, async (): Promise<void> => {
      const targetWindow: window.Window = await getMainWindow(context);
      const before: window.AvoidArea = targetWindow.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
      await router.pushUrl({ url: 'Video/VideoPage' });
      await driver.delayMs(240);
      const after: window.AvoidArea =
        (await getMainWindow(context)).getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
      expect(after.leftRect.width).assertEqual(before.leftRect.width);
      expect(after.topRect.height).assertEqual(before.topRect.height);
      expect(after.rightRect.width).assertEqual(before.rightRect.width);
      expect(after.bottomRect.height).assertEqual(before.bottomRect.height);
    });

    ;
    const mainWindow = async (): Promise<window.Window> => {
      return window.getLastWindow(context);
    };
    const restoreRoot = async (): Promise<void> => {
      let state: router.RouterState = router.getState();
      while (state.index > 1) {
        router.back();
        await driver.delayMs(180);
        state = router.getState();
      }
      await driver.assertComponentExist(ON.id('tab0'));
    };
  });

  describe('WindowEventContractTest', () => {
    let driver: Driver;
    let context: common.UIAbilityContext;
    let mainWindow: window.Window;

    const foregroundApplication = async (): Promise<void> => {
      context = await launchEntryAbilityContext();
      await driver.delayMs(420);
      await driver.assertComponentExist(ON.id('tab0'));
      mainWindow = await getMainWindow(context);
    };

    beforeAll(async (): Promise<void> => {
      driver = Driver.create();
      await foregroundApplication();
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
      await driver.delayMs(180);
    });

    beforeEach(async (): Promise<void> => {
      await foregroundApplication();
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
      await driver.delayMs(180);
    });

    afterEach(async (): Promise<void> => {
      mainWindow.off('windowSizeChange');
      mainWindow.off('windowVisibilityChange');
      mainWindow.off('windowEvent');
      mainWindow.off('windowStatusChange');
      mainWindow.off('noInteractionDetected');
      await foregroundApplication();
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
    });

    afterAll(async (): Promise<void> => {
      mainWindow.off('windowSizeChange');
      mainWindow.off('windowVisibilityChange');
      mainWindow.off('windowEvent');
      mainWindow.off('windowStatusChange');
      mainWindow.off('noInteractionDetected');
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
      await driver.pressHome();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_WINDOW_EVENT_0100
     * @tc.name windowSizeUnsubscribeBoundary002
     * @tc.desc Verify Window off windowSizeChange prevents notifications after a second physical rotation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('windowSizeUnsubscribeBoundary002', 0, async (): Promise<void> => {
      let notificationCount: number = 0;
      const sizeCallback = (size: window.Size): void => {
        notificationCount++;
      };
      mainWindow.on('windowSizeChange', sizeCallback);
      await driver.setDisplayRotation(DisplayRotation.ROTATION_90);
      await driver.delayMs(320);
      expect(notificationCount > 0).assertTrue();
      mainWindow.off('windowSizeChange', sizeCallback);
      const countAfterOff: number = notificationCount;
      await driver.setDisplayRotation(DisplayRotation.ROTATION_180);
      await driver.delayMs(320);

      expect(notificationCount).assertEqual(countAfterOff);
    });




  });

  describe('WindowOrientationContractTest', () => {
    let driver: Driver;
    let context: common.UIAbilityContext;
    let baselineOrientation: window.Orientation = window.Orientation.UNSPECIFIED;

    beforeAll(async (): Promise<void> => {
      context = await launchEntryAbilityContext();
      driver = Driver.create();
      await driver.delayMs(500);
      await restoreRouterRoot(driver);
    });

    beforeEach(async (): Promise<void> => {
      await restoreRouterRoot(driver);
      baselineOrientation = (await getMainWindow(context)).getPreferredOrientation();
    });

    afterEach(async (): Promise<void> => {
      await (await getMainWindow(context)).setPreferredOrientation(baselineOrientation);
      await restoreRouterRoot(driver);
    });

    afterAll(async (): Promise<void> => {
      await (await getMainWindow(context)).setPreferredOrientation(window.Orientation.UNSPECIFIED);
      await restoreRouterRoot(driver);
      await driver.pressHome();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_WINDOW_ORIENTATION_0100
     * @tc.name windowPreferredOrientationReadback001
     * @tc.desc Verify Window.setPreferredOrientation changes the main window orientation and the UI remains usable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('windowPreferredOrientationReadback001', 0, async (): Promise<void> => {
      const mainWindow: window.Window = await getMainWindow(context);

      // The TV pages are designed to survive orientation changes without replacing the main window.
      // Reading the value back verifies the window manager accepted the request instead of only completing a promise.
      await mainWindow.setPreferredOrientation(window.Orientation.LANDSCAPE);
      await driver.delayMs(420);
      const preferredOrientation: window.Orientation = mainWindow.getPreferredOrientation();
      const properties: window.WindowProperties = mainWindow.getWindowProperties();
      await driver.assertComponentExist(ON.id('tab0'));
      expect(preferredOrientation).assertEqual(window.Orientation.LANDSCAPE);

      // The orientation request must reach the live window, not only the stored preference.
      expect(properties.windowRect.width >= properties.windowRect.height).assertTrue();
    });
  });

  describe('WindowUIContextContractTest', () => {
    let driver: Driver;
    let context: common.UIAbilityContext;

    beforeAll(async (): Promise<void> => {
      context = await launchEntryAbilityContext();
      driver = Driver.create();
      await driver.delayMs(500);
      await restoreRouterRoot(driver);
    });

    beforeEach(async (): Promise<void> => {
      await restoreRouterRoot(driver);
    });

    afterEach(async (): Promise<void> => {
      await restoreRouterRoot(driver);
    });

    afterAll(async (): Promise<void> => {
      await restoreRouterRoot(driver);
      await driver.pressHome();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_WINDOW_UI_CONTEXT_0100
     * @tc.name windowUIContextRouterIdentity001
     * @tc.desc Verify Window.getUIContext exposes a router state matching the active EntryAbility route
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('windowUIContextRouterIdentity001', 0, async (): Promise<void> => {
      const mainWindow: window.Window = await getMainWindow(context);
      const contextRouter = mainWindow.getUIContext().getRouter();
      const windowState: router.RouterState = contextRouter.getState();
      const globalState: router.RouterState = router.getState();

      // Index.ets obtains its router through the UI context, while tests often use the module router singleton.
      // Equal state proves both paths address the same page stack instead of unrelated UI instances.
      expect(windowState.index).assertEqual(globalState.index);
      expect(windowState.name).assertEqual(globalState.name);
      expect(windowState.path).assertEqual(globalState.path);

      // Expected features of the live UI context: repeated acquisitions resolve to the same
      // usable router after loadContent, and the observed stack is the real Index root page.
      const secondState: router.RouterState = mainWindow.getUIContext().getRouter().getState();
      expect(secondState.index).assertEqual(windowState.index);
      expect(secondState.path).assertEqual(windowState.path);
      expect(windowState.index).assertEqual(1);
      expect(windowState.path).assertEqual('pages/');
      await driver.assertComponentExist(ON.id('tab0'));
    });

  });

  describe('DisplayCutoutAreaContractTest', () => {
    let driver: Driver;

    const assertRectInsideDisplay = (area: display.Rect, screen: display.Display): void => {
      // Cutout and available-area rectangles are system coordinates, so negative sizes would corrupt layout avoidance.
      // Bounds checks also prevent a driver from returning stale geometry after a rotation transition.
      const leftFinite: boolean = Number.isFinite(area.left);
      const topFinite: boolean = Number.isFinite(area.top);
      const widthFinite: boolean = Number.isFinite(area.width);
      const heightFinite: boolean = Number.isFinite(area.height);
      expect(leftFinite).assertTrue();
      expect(topFinite).assertTrue();
      expect(widthFinite).assertTrue();
      expect(heightFinite).assertTrue();
      expect(area.left >= 0).assertTrue();
      expect(area.top >= 0).assertTrue();
      expect(area.width >= 0).assertTrue();
      expect(area.height >= 0).assertTrue();
      expect(area.left + area.width <= screen.width).assertTrue();
      expect(area.top + area.height <= screen.height).assertTrue();
    };

    const assertWaterfallAreas = (info: display.CutoutInfo, screen: display.Display): void => {
      assertRectInsideDisplay(info.waterfallDisplayAreaRects.left, screen);
      assertRectInsideDisplay(info.waterfallDisplayAreaRects.top, screen);
      assertRectInsideDisplay(info.waterfallDisplayAreaRects.right, screen);
      assertRectInsideDisplay(info.waterfallDisplayAreaRects.bottom, screen);
    };

    beforeAll(async (): Promise<void> => {
      await startAppWithRetry(WINDOW_DISPLAY_CONTRACT_WANT, 'com.sample.demonstration');
      driver = Driver.create();
      await driver.delayMs(500);
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
      await driver.assertComponentExist(ON.id('tab0'));
    });

    beforeEach(async (): Promise<void> => {
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
      await driver.delayMs(180);
    });

    afterEach(async (): Promise<void> => {
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
    });

    afterAll(async (): Promise<void> => {
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
      await driver.pressHome();
    });


    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_AREA_0200
     * @tc.name displayCutoutInfoStructure002
     * @tc.desc Verify Display.getCutoutInfo returns bounded cutout and waterfall rectangles on the TV display
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayCutoutInfoStructure002', 0, async (): Promise<void> => {
      const screen: display.Display = display.getDefaultDisplaySync();
      const info: display.CutoutInfo = await screen.getCutoutInfo();

      // A TV panel ships without a notch: the cutout inventory must be empty, or at most hold
      // degenerate zero-size rectangles that layout code can safely ignore. Any rectangle
      // with a positive width or height would corrupt fullscreen layout on a cutout-free panel.
      let cutoutEmpty: boolean = info.boundingRects.length === 0;
      for (let index: number = 0; index < info.boundingRects.length; index++) {
        assertRectInsideDisplay(info.boundingRects[index], screen);
        if (info.boundingRects[index].width !== 0 || info.boundingRects[index].height !== 0) {
          cutoutEmpty = false;
        }
      }
      expect(cutoutEmpty).assertTrue();

      // Waterfall fields still need a stable, bounded shape because layout code may inspect them unconditionally.
      assertWaterfallAreas(info, screen);
    });

  });

  describe('DisplayEventContractTest', () => {
    let driver: Driver;

    const assertUsableDisplay = (screen: display.Display): void => {
      expect(screen.id >= 0).assertTrue();
      expect(screen.width > 0).assertTrue();
      expect(screen.height > 0).assertTrue();
      expect(screen.densityDPI > 0).assertTrue();
      expect(screen.densityPixels > 0).assertTrue();
      expect(screen.scaledDensity > 0).assertTrue();
      expect(screen.refreshRate > 0).assertTrue();
    };

    beforeAll(async (): Promise<void> => {
      await startAppWithRetry(WINDOW_DISPLAY_CONTRACT_WANT, 'com.sample.demonstration');
      driver = Driver.create();
      await driver.delayMs(500);
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
      await driver.assertComponentExist(ON.id('tab0'));
    });

    beforeEach(async (): Promise<void> => {
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
      await driver.delayMs(180);
      display.off('change');
    });

    afterEach(async (): Promise<void> => {
      display.off('change');
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
    });

    afterAll(async (): Promise<void> => {
      display.off('change');
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
      await driver.pressHome();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EVENT_0100
     * @tc.name displayAsyncInventory001
     * @tc.desc Verify display getAllDisplays returns a unique usable inventory containing the default TV display
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayAsyncInventory001', 0, async (): Promise<void> => {
      const screens: display.Display[] = await display.getAllDisplays();
      const defaultScreen: display.Display = display.getDefaultDisplaySync();
      const identifiers: Set<number> = new Set<number>();
      let defaultFound: boolean = false;
      expect(screens.length > 0).assertTrue();
      for (let index: number = 0; index < screens.length; index++) {
        assertUsableDisplay(screens[index]);
        identifiers.add(screens[index].id);
        if (screens[index].id === defaultScreen.id) {
          defaultFound = true;
        }
      }
      expect(identifiers.size).assertEqual(screens.length);
      expect(defaultFound).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EVENT_0200
     * @tc.name displayAsyncDefaultSnapshot002
     * @tc.desc Verify getAllDisplays default entry matches getDefaultDisplaySync geometry and density
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayAsyncDefaultSnapshot002', 0, async (): Promise<void> => {
      const screens: display.Display[] = await display.getAllDisplays();
      const defaultScreen: display.Display = display.getDefaultDisplaySync();
      let matchIndex: number = -1;
      for (let index: number = 0; index < screens.length; index++) {
        if (screens[index].id === defaultScreen.id) {
          matchIndex = index;
        }
      }

      // The inventory lookup must hit at least once; otherwise every comparison below would
      // silently degenerate into a self-comparison of the synchronous snapshot.
      expect(matchIndex >= 0).assertTrue();
      const matchingScreen: display.Display = screens[matchIndex];
      expect(matchingScreen.width).assertEqual(defaultScreen.width);
      expect(matchingScreen.height).assertEqual(defaultScreen.height);
      expect(matchingScreen.densityDPI).assertEqual(defaultScreen.densityDPI);
      expect(matchingScreen.densityPixels).assertEqual(defaultScreen.densityPixels);
      expect(matchingScreen.refreshRate).assertEqual(defaultScreen.refreshRate);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EVENT_0300
     * @tc.name displayRotationChangeNotification003
     * @tc.desc Verify display change callback identifies the default display after a real 90 degree rotation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayRotationChangeNotification003', 0, async (): Promise<void> => {
      let notificationCount: number = 0;
      let notifiedDisplayId: number = -1;
      const changeCallback = (displayId: number): void => {
        notificationCount++;
        notifiedDisplayId = displayId;
      };
      display.on('change', changeCallback);
      const before: display.Display = display.getDefaultDisplaySync();
      const beforeWidth: number = before.width;
      const beforeHeight: number = before.height;
      await driver.setDisplayRotation(DisplayRotation.ROTATION_90);
      await driver.delayMs(360);
      const after: display.Display = display.getDefaultDisplaySync();
      expect(notificationCount > 0).assertTrue();
      expect(notifiedDisplayId).assertEqual(after.id);
      expect(after.id).assertEqual(before.id);
      expect(after.width !== beforeWidth || after.height !== beforeHeight).assertTrue();
      display.off('change', changeCallback);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EVENT_0400
     * @tc.name displayConcurrentInventory005
     * @tc.desc Verify concurrent getAllDisplays requests return one consistent TV display inventory
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayConcurrentInventory005', 0, async (): Promise<void> => {
      const inventories: display.Display[][] = await Promise.all([
        display.getAllDisplays(), display.getAllDisplays(), display.getAllDisplays(), display.getAllDisplays()
      ]);
      const baseline: display.Display[] = inventories[0];
      expect(baseline.length > 0).assertTrue();
      for (let requestIndex: number = 1; requestIndex < inventories.length; requestIndex++) {
        expect(inventories[requestIndex].length).assertEqual(baseline.length);
        for (let displayIndex: number = 0; displayIndex < baseline.length; displayIndex++) {
          expect(inventories[requestIndex][displayIndex].id).assertEqual(baseline[displayIndex].id);
          expect(inventories[requestIndex][displayIndex].width).assertEqual(baseline[displayIndex].width);
          expect(inventories[requestIndex][displayIndex].height).assertEqual(baseline[displayIndex].height);
        }
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_EVENT_0500
     * @tc.name displayRotationRoundTrip006
     * @tc.desc Verify display change events preserve identity and restore original geometry after a rotation round trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayRotationRoundTrip006', 0, async (): Promise<void> => {
      const original: display.Display = display.getDefaultDisplaySync();
      const originalWidth: number = original.width;
      const originalHeight: number = original.height;
      const originalRotation: number = original.rotation;
      const notifiedIds: number[] = [];
      const changeCallback = (displayId: number): void => {
        notifiedIds.push(displayId);
      };
      display.on('change', changeCallback);
      await driver.setDisplayRotation(DisplayRotation.ROTATION_90);
      await driver.delayMs(300);
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
      await driver.delayMs(340);
      const restored: display.Display = display.getDefaultDisplaySync();
      expect(notifiedIds.length >= 2).assertTrue();
      for (let index: number = 0; index < notifiedIds.length; index++) {
        expect(notifiedIds[index]).assertEqual(original.id);
      }
      expect(restored.width).assertEqual(originalWidth);
      expect(restored.height).assertEqual(originalHeight);
      expect(restored.rotation).assertEqual(originalRotation);
      display.off('change', changeCallback);
    });
  });

}
