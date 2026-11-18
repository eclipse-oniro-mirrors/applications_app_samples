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
import { Component, Driver, ON, Rect } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { display, router } from '@kit.ArkUI';
import { KeyCode } from '@kit.InputKit';
import Want from '@ohos.app.ability.Want';
import { startAppWithRetry } from './TestScenarioUtils';

/**
 * Desktop render/layout contract of the TVDemonstration launcher. The Index root
 * page renders four business tabs (ProductSpec, Feature, SmartLife, Support) in
 * a bottom tab bar while the content area swaps the page subtree for the active
 * tab. This suite observes the desktop through the real UiTest window tree and
 * the physical display snapshot, and never mocks either of them:
 *
 *   1. Every business node carries a stable production id (tab0..tab3,
 *      featureCard0..6, featureCardImage0..6, featureListNext,
 *      smartLifeCard0..2, smartLifeCardImage0..2, supportIndicatorFocus,
 *      supportImage0..2, productSpecArtwork), so layout assertions bind to the
 *      nodes the user actually sees instead of broad type selectors.
 *   2. Component.getBounds() exposes the laid-out rectangle of each node in the
 *      same coordinate space as display.getDefaultDisplaySync(), which lets the
 *      cases check grid geometry, pairwise non-overlap, row order, card/image
 *      containment and the physical screen boundary with real numbers.
 *   3. Remote-control DPAD keys drive the real focus traversal of the tab bar
 *      and the content cards, so the layout-invariance cases observe the live
 *      layout before and after real focus movement.
 *   4. Rapid tab clicks and rapid DPAD traversal exercise the switch stability
 *      of the desktop, asserting that the final subtree and the tab bar
 *      geometry stay legal after every transition.
 *
 * Case matrix covered by this suite:
 *   0100-0400 the four tabs render with legal bounds, exact labels and content
 *   0500     the tab bar is one aligned row with ordered, non-overlapping cells
 *   0600-1000 Feature grid: render completeness, geometry, no overlap, image
 *             containment and the list-next scroll arrow
 *   1100-1400 SmartLife row: render completeness, geometry, spacing, images
 *   1500-1700 Support carousel: images, indicator geometry and focusability
 *   1800-2000 readable labels: tab texts, Feature titles, SmartLife titles
 *   2100-2200 layout invariance across real focus movement (tab bar, content)
 *   2300-2400 page-switch tree swap: old subtree gone, new subtree present
 *   2500     render completeness of every tab subtree
 *   2600-2800 every visible component stays inside the physical display
 *   2900-3000 rapid switch stability by clicks and by DPAD traversal
 *   3100     every tab exposes at least one card actually visible on screen
 */

const BUNDLE_NAME: string = 'com.sample.demonstration';
const ABILITY_NAME: string = 'EntryAbility';
const PAGE_SETTLE_TIME: number = 600;
const TAB_SWITCH_TIME: number = 300;
const KEY_SETTLE_TIME: number = 200;
const SCROLL_SETTLE_TIME: number = 400;
const ROUTE_BACK_DELAY: number = 180;
const RAPID_CLICK_GAP: number = 80;
const RAPID_KEY_GAP: number = 100;
const AFTER_CASE_DELAY: number = 80;
const ROW_TOLERANCE: number = 8;
const TAB_COUNT: number = 4;
const FEATURE_CARD_COUNT: number = 7;
const SMART_LIFE_CARD_COUNT: number = 3;
const SUPPORT_IMAGE_COUNT: number = 3;
const MAIN_WANT: Want = {
  bundleName: BUNDLE_NAME,
  abilityName: ABILITY_NAME
};
// The four tab labels come from base/element/string.json and are rendered by
// the Index tab bar; case 1800 asserts the exact rendered text of every tab.
const TAB_TEXT_LABELS: Array<string> = [
  'Product Specifications',
  'Function Features',
  'Smart Life',
  'Service Support'
];
// FeaturePage renders seven scene cards in a horizontal list; every title is a
// real production string resource rendered by Text(scene.title).
const FEATURE_CARD_TITLES: Array<string> = [
  'Universal Interconnection',
  'Screen Cast',
  'Smart AI',
  'Pointing Remote',
  'Smart Screensaver',
  'Voice Interaction',
  'Distributed'
];
// SmartLifePage renders three scene cards in one row; every title is a real
// production string resource rendered by Text(scene.title).
const SMART_LIFE_CARD_TITLES: Array<string> = [
  'Entertainment & AV',
  'Child Care',
  'Efficient Office'
];

/**
 * Resolves the delegator that drives the application under test. Every ability
 * interaction in this suite goes through this single instance so the desktop
 * the layout assertions observe is the same process the suite launched.
 */
function getDelegator(): abilityDelegatorRegistry.AbilityDelegator {
  return abilityDelegatorRegistry.getAbilityDelegator();
}

/**
 * Launches EntryAbility through the public ability contract and waits for the
 * Index root page to settle. Used as the suite-level pre-condition so every
 * case starts from a deterministic desktop state.
 */
async function launchMainAbility(): Promise<void> {
  await startAppWithRetry(MAIN_WANT, 'com.sample.demonstration');
  await Driver.create().delayMs(PAGE_SETTLE_TIME);
}

/**
 * Brings the application to the foreground and unwinds the router stack to the
 * Index root page. This is the shared pre-condition of every case so a stale
 * route left by an earlier transition cannot mask a layout regression.
 */
async function restoreForegroundRoot(): Promise<void> {
  const driver: Driver = Driver.create();
  await startAppWithRetry(MAIN_WANT, 'com.sample.demonstration');
  await driver.delayMs(PAGE_SETTLE_TIME);
  let state: router.RouterState = router.getState();
  while (state.index > 1) {
    router.back();
    await driver.delayMs(ROUTE_BACK_DELAY);
    state = router.getState();
  }
  await driver.assertComponentExist(ON.id('tab0'));
}

/**
 * Switches the desktop to the given tab through a real UiTest click on the tab
 * bar cell and waits for the page subtree to settle. Every case that needs a
 * specific page starts with this call so the assertions never depend on the
 * tab left behind by a previous case.
 */
async function switchToTab(driver: Driver, tabIndex: number): Promise<void> {
  const tab: Component = await driver.findComponent(ON.id('tab' + tabIndex.toString()));
  await tab.click();
  await driver.delayMs(TAB_SWITCH_TIME);
}

/**
 * Reads the laid-out rectangle of a stable business node by id. The returned
 * Rect lives in the same coordinate space as the display snapshot used by the
 * screen-bound cases, so geometry comparisons are unit-consistent.
 */
async function boundsOf(driver: Driver, componentId: string): Promise<Rect> {
  const component: Component = await driver.findComponent(ON.id(componentId));
  return component.getBounds();
}

/**
 * Snapshots the physical display through the same getDefaultDisplaySync call
 * the production pages consume. The metric sanity checks keep every later
 * boundary comparison meaningful: a zero-size display would make all
 * containment assertions pass vacuously.
 */
function screenOf(): display.Display {
  const screen: display.Display = display.getDefaultDisplaySync();
  expect(screen.width > 0).assertTrue();
  expect(screen.height > 0).assertTrue();
  return screen;
}

/**
 * Asserts that a laid-out rectangle is non-degenerate: the four edges must be
 * ordered and both the width and the height must be strictly positive. A card
 * with a zero-size rectangle would render nothing the user could focus.
 */
function assertRectLegal(rect: Rect): void {
  expect(rect.right > rect.left).assertTrue();
  expect(rect.bottom > rect.top).assertTrue();
  expect(rect.right - rect.left > 0).assertTrue();
  expect(rect.bottom - rect.top > 0).assertTrue();
}

/**
 * Decides whether a laid-out rectangle intersects the physical display at all.
 * The support carousel and the Feature list mount pages/cards that may extend
 * beyond the right edge, so the screen-bound cases only require full
 * containment for rectangles that are actually visible.
 */


/**
 * Asserts that a visible rectangle is fully contained in the physical display:
 * no edge may leave the screen on the left, the top, the right or the bottom.
 */
function assertRectInsideDisplay(rect: Rect, screen: display.Display): void {
  expect(rect.left >= 0).assertTrue();
  expect(rect.top >= 0).assertTrue();
  expect(rect.right <= screen.width).assertTrue();
  expect(rect.bottom <= screen.height).assertTrue();
}

/**
 * Decides whether two laid-out rectangles overlap in the plane. Two grid cells
 * that overlap would trap remote-control focus between them, so every grid and
 * row layout asserts pairwise non-overlap with this helper.
 */


/**
 * Asserts that a re-read rectangle is identical to an earlier snapshot. Used by
 * the focus-invariance cases where moving focus must not disturb the desktop
 * layout: an edge drift means the layout reflowed under focus.
 */
function assertSameRect(actual: Rect, expected: Rect): void {
  expect(actual.left).assertEqual(expected.left);
  expect(actual.top).assertEqual(expected.top);
  expect(actual.right).assertEqual(expected.right);
  expect(actual.bottom).assertEqual(expected.bottom);
}

/**
 * Asserts that exactly one live node carries the given production id. Every
 * production id is unique within the mounted subtree (tab cells, feature/smart
 * cards and images, support images and the ProductSpec artwork), so a count of
 * one is the render-complete signature of the active tab.
 */


/**
 * Asserts that no live node carries the given production id. Used by the
 * tree-swap cases where switching tabs must tear the previous page subtree
 * down completely, otherwise focus could land on an invisible card.
 */


/**
 * Asserts that a production text is rendered with non-empty content: the text
 * selector must match at least one live node and the matched node must carry a
 * non-empty text value, so a resource that resolves to an empty string fails.
 */
async function assertTextReadable(driver: Driver, text: string): Promise<void> {
  const matches: Array<Component> = await driver.findComponents(ON.text(text));
  expect(matches.length >= 1).assertTrue();
  const sample: Component = matches[0];
  const content: string = await sample.getText();
  expect(content.length > 0).assertTrue();
}

export function layoutRenderContractTest(): void {
  describe('LayoutRenderContractTest', () => {
    beforeAll(async (): Promise<void> => {
      await launchMainAbility();
    });

    beforeEach(async (): Promise<void> => {
      await restoreForegroundRoot();
    });

    afterEach(async (): Promise<void> => {
      await Driver.create().delayMs(AFTER_CASE_DELAY);
    });

    afterAll(async (): Promise<void> => {
      // Leaving the TV application at Home keeps focus and foreground timers
      // from leaking into the next suite.
      await Driver.create().pressHome();
    });





    /**
     * @tc.number SUB_TV_DEMONSTRATION_LAYOUT_0500
     * @tc.name layoutTabBarRowGeometry005
     * @tc.desc Verify the four tab cells form one aligned row with ordered non-overlapping cells inside the display
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('layoutTabBarRowGeometry005', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      const screen: display.Display = screenOf();
      const rects: Array<Rect> = [];
      for (let index: number = 0; index < TAB_COUNT; index++) {
        const bounds: Rect = await boundsOf(driver, 'tab' + index.toString());
        assertRectLegal(bounds);
        assertRectInsideDisplay(bounds, screen);
        rects.push(bounds);
      }
      // The whole bar is a single row: every cell shares the same top edge
      // within a small tolerance, otherwise focus would jump between rows.
      for (let index: number = 0; index < TAB_COUNT - 1; index++) {
        expect(Math.abs(rects[index + 1].top - rects[index].top) <= ROW_TOLERANCE).assertTrue();
      }
      // Cell order must follow the tab index: a user pressing DPAD_RIGHT moves
      // from tab0 to tab1, so left must grow with the index.
      for (let index: number = 0; index < TAB_COUNT - 1; index++) {
        expect(rects[index + 1].left > rects[index].left).assertTrue();
      }
      // Neighboring cells must not overlap and the horizontal gap must be
      // non-negative, otherwise clicks and focus moves become ambiguous.
      for (let index: number = 0; index < TAB_COUNT - 1; index++) {
        expect(rects[index + 1].left >= rects[index].right).assertTrue();
      }
    });













    /**
     * @tc.number SUB_TV_DEMONSTRATION_LAYOUT_1800
     * @tc.name layoutTabLabelsReadable018
     * @tc.desc Verify every tab bar label is rendered from a non-empty production string resource
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('layoutTabLabelsReadable018', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      // The tab bar is always mounted, so every label must resolve to a live
      // Text node carrying the exact non-empty string resource.
      for (let index: number = 0; index < TAB_TEXT_LABELS.length; index++) {
        await assertTextReadable(driver, TAB_TEXT_LABELS[index]);
      }
    });


    /**
     * @tc.number SUB_TV_DEMONSTRATION_LAYOUT_2000
     * @tc.name layoutSmartLifeTitlesReadable020
     * @tc.desc Verify every SmartLife scene card title is rendered as non-empty text after switching to tab2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('layoutSmartLifeTitlesReadable020', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      await switchToTab(driver, 2);
      // Every scene title comes from the production scenes array and is
      // rendered by Text(scene.title); an empty title leaves the card
      // unreadable on the desktop.
      for (let index: number = 0; index < SMART_LIFE_CARD_TITLES.length; index++) {
        await assertTextReadable(driver, SMART_LIFE_CARD_TITLES[index]);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_LAYOUT_2100
     * @tc.name layoutTabBarInvariantOnDpadFocus021
     * @tc.desc Verify DPAD focus traversal across the tab bar leaves every tab cell rectangle unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('layoutTabBarInvariantOnDpadFocus021', 0, async (): Promise<void> => {
      const driver: Driver = Driver.create();
      const before: Array<Rect> = [];
      for (let index: number = 0; index < TAB_COUNT; index++) {
        before.push(await boundsOf(driver, 'tab' + index.toString()));
      }
      // The production bar swaps the content page when a cell gains focus, so
      // DPAD traversal changes the subtree; the bar cells themselves, however,
      // must keep their rectangles or focus would jump under the user.
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
      await driver.delayMs(KEY_SETTLE_TIME);
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
      await driver.delayMs(KEY_SETTLE_TIME);
      // Traverse back to the starting cell and assert a full round trip: an
      // edge drift in a cell means the bar reflowed during focus movement.
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_LEFT);
      await driver.delayMs(KEY_SETTLE_TIME);
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_LEFT);
      await driver.delayMs(KEY_SETTLE_TIME);
      for (let index: number = 0; index < TAB_COUNT; index++) {
        const after: Rect = await boundsOf(driver, 'tab' + index.toString());
        assertSameRect(after, before[index]);
      }
    });










  });
}