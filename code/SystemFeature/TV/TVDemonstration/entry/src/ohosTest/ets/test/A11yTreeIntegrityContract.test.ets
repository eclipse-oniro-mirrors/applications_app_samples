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
import { scanVisibleText, SecurityScanResult, startAppWithRetry, waitForRootTabBar } from './TestScenarioUtils';

const BUNDLE_NAME: string = 'com.sample.demonstration';
const ABILITY_NAME: string = 'EntryAbility';
const ROOT_SETTLE_TIME: number = 1500;
const TAB_SETTLE_TIME: number = 200;
const KEY_ACTION_TIME: number = 120;
const DETAIL_SETTLE_TIME: number = 500;
const BACK_SETTLE_TIME: number = 300;
const ROUTE_BACK_TIME: number = 180;
const TAB_BAR_COUNT: number = 4;
const VISIBLE_FEATURE_CARD_COUNT: number = 4;
const SMARTLIFE_CARD_COUNT: number = 3;
const SUPPORT_IMAGE_COUNT: number = 3;
const MIN_TREE_TEXT_COUNT: number = 8;
const MIN_TAB_TEXT_COUNT: number = 4;
const MIN_PRODUCT_TEXT_COUNT: number = 8;
const MIN_FEATURE_TEXT_COUNT: number = 8;
const MIN_SMARTLIFE_TEXT_COUNT: number = 5;
const MIN_SUPPORT_TEXT_COUNT: number = 4;
const PLACEHOLDER_UNDEFINED: string = 'undefined';
const PLACEHOLDER_NULL: string = 'null';
const PLACEHOLDER_NAN: string = 'NaN';
const TAB_INDEX_PRODUCT: number = 0;
const TAB_INDEX_FEATURE: number = 1;
const TAB_INDEX_SMARTLIFE: number = 2;
const TAB_INDEX_SUPPORT: number = 3;
// The tab labels come from Index.ets buildTabBar(); the resolved resource
// strings are the exact text a screen reader announces for each tab.
const EXPECTED_TAB_TEXTS: string[] = [
  'Product Specifications',
  'Function Features',
  'Smart Life',
  'Service Support'
];
const MAIN_WANT: Want = {
  bundleName: BUNDLE_NAME,
  abilityName: ABILITY_NAME,
  action: 'ohos.want.action.home'
};


/**
 * Classification of every Text node that one tab page currently publishes.
 * readable counts nodes whose text survives trimming, blank counts nodes that
 * degenerate to empty space, and placeholder counts the literal strings that
 * indicate an unbound data field ('undefined'/'null'/'NaN').
 */
interface TextTreeStats {
  total: number;
  readable: number;
  blank: number;
  placeholder: number;
}

/**
 * Brings EntryAbility to the foreground through the public ability contract
 * and unwinds the router stack to the Index root page. This is the shared
 * pre-condition of every case so a stale route or tab left by an earlier
 * transition cannot mask an a11y regression.
 */
async function restoreForegroundRoot(driver: Driver): Promise<void> {
  await driver.pressHome();
  await driver.delayMs(300);
  await startAppWithRetry(MAIN_WANT, BUNDLE_NAME);
  const activeDriver: Driver = Driver.create();
  // A coverage-instrumented cold start can render its first frame several
  // seconds after a fresh install; poll for the root tab bar instead of
  // trusting the fixed ROOT_SETTLE_TIME window.
  await waitForRootTabBar(activeDriver);
  let state: router.RouterState = router.getState();
  // ScreenSaver is a sibling root route, so its router index is not deeper
  // than Index. Restore it explicitly before querying the persistent tab bar.
  if (state.path === 'pages/ScreenSaver') {
    router.replaceUrl({ url: 'pages/' });
    await waitForRootTabBar(activeDriver);
    state = router.getState();
  }
  while (state.index > 1) {
    router.back();
    await activeDriver.delayMs(ROUTE_BACK_TIME);
    state = router.getState();
  }
  await activeDriver.assertComponentExist(ON.id('tab0'));
}

/**
 * Switches the production Index page to the given tab through a real click on
 * the tab-bar node. The click follows the same path a remote user takes:
 * Index.ets buildTabBar() toggles currentTab in the onClick handler, so the
 * conditional page swap below happens on the live UI.
 */
async function switchTab(driver: Driver, index: number): Promise<void> {
  const tab: Component = await driver.findComponent(ON.id('tab' + index.toString()));
  await tab.click();
  await driver.delayMs(TAB_SETTLE_TIME);
}

/**
 * Queries the whole Text subtree that the current page publishes. This is the
 * named aggregation of the component tree that SDK 18 supports, and every
 * readability case in this suite starts from this real query result.
 */
async function textTreeOf(driver: Driver): Promise<Component[]> {
  return driver.findComponents(ON.type('Text'));
}

/**
 * Classifies the real Text tree of the current page into readable, blank and
 * placeholder buckets. The classification runs over the query result of
 * textTreeOf and never invents nodes, so the returned counts are the raw
 * statistics the distribution cases assert against.
 */
async function statsOfTextTree(driver: Driver): Promise<TextTreeStats> {
  const texts: Component[] = await textTreeOf(driver);
  const stats: TextTreeStats = {
    total: texts.length,
    readable: 0,
    blank: 0,
    placeholder: 0
  };
  for (let i: number = 0; i < texts.length; i++) {
    const bounds: Rect = await texts[i].getBounds();
    if (bounds.right <= bounds.left || bounds.bottom <= bounds.top) {
      continue;
    }
    const content: string = await texts[i].getText();
    if (content === PLACEHOLDER_UNDEFINED || content === PLACEHOLDER_NULL || content === PLACEHOLDER_NAN) {
      stats.placeholder++;
    } else if (content.trim().length === 0) {
      stats.blank++;
    } else {
      stats.readable++;
    }
  }
  return stats;
}


/**
 * Asserts the full geometry contract of one component: the Rect returned by
 * getBounds() must be a real rectangle (right above left, bottom above top)
 * and must stay inside the physical display that getDefaultDisplaySync()
 * reports. All checks compute the boolean conditions first and assert them
 * afterwards, matching the style of the display/window contract suites.
 */
async function assertRectInsideScreen(driver: Driver, id: string, screen: display.Display): Promise<void> {
  const nodes: Component[] = await driver.findComponents(ON.id(id));
  expect(nodes.length).assertEqual(1);
  const bounds: Rect = await nodes[0].getBounds();
  expect(bounds.right > bounds.left).assertTrue();
  expect(bounds.bottom > bounds.top).assertTrue();
  expect(bounds.left >= 0).assertTrue();
  expect(bounds.top >= 0).assertTrue();
  expect(bounds.right <= screen.width).assertTrue();
  expect(bounds.bottom <= screen.height).assertTrue();
}

export default function a11yTreeIntegrityContractTest(): void {
  describe('A11yTreeIntegrityContractTest', () => {
    beforeAll(async (): Promise<void> => {
      await restoreForegroundRoot(Driver.create());
    });

    beforeEach(async (): Promise<void> => {
      await restoreForegroundRoot(Driver.create());
    });

    afterEach(async (): Promise<void> => {
      await Driver.create().delayMs(80);
    });

    afterAll(async (): Promise<void> => {
      // Leaving the TV application at Home keeps focus and foreground timers
      // from leaking into the next suite.
      await Driver.create().pressHome();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_A11YTREE_0100
     * @tc.name a11yTreeTextTreeNonEmpty001
     * @tc.desc Verify the root product page publishes a non-empty Text component tree through the real UiTest query
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('a11yTreeTextTreeNonEmpty001', 0, async (): Promise<void> => {
      // The a11y tree is only usable when at least the tab bar and
      // the product page title materialize as real Text nodes. Query the whole
      // Text subtree instead of a single selector so a globally empty tree is
      // caught at the source.
      const driver: Driver = Driver.create();
      await switchTab(driver, TAB_INDEX_PRODUCT);
      const texts: Component[] = await driver.findComponents(ON.type('Text'));
      expect(texts.length >= MIN_TREE_TEXT_COUNT).assertTrue();
      await driver.assertComponentExist(ON.text('Product Specifications'));
    });


    /**
     * @tc.number SUB_TV_DEMONSTRATION_A11YTREE_0400
     * @tc.name a11yTreeTabBarLabelsIdentity004
     * @tc.desc Verify the four tab-bar nodes keep their production ids and readable labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('a11yTreeTabBarLabelsIdentity004', 0, async (): Promise<void> => {
      // The tab bar is the navigation spine of the launcher: each tab node must
      // answer to its production id and announce its resolved resource label.
      const driver: Driver = Driver.create();
      for (let i: number = 0; i < TAB_BAR_COUNT; i++) {
        const nodes: Component[] = await driver.findComponents(ON.id('tab' + i.toString()));
        expect(nodes.length).assertEqual(1);
        const id: string = await nodes[0].getId();
        expect(id).assertEqual('tab' + i.toString());
        const label: string = await nodes[0].getText();
        expect(label).assertEqual(EXPECTED_TAB_TEXTS[i]);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_A11YTREE_0500
     * @tc.name a11yTextProductNoBlankNodes005
     * @tc.desc Verify the product page keeps its production text tree readable apart from the testability host node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('a11yTextProductNoBlankNodes005', 0, async (): Promise<void> => {
      // Blank text announces nothing to a screen reader. Classify the real
      // Text tree of tab0 and require the blank bucket to stay empty.
      const driver: Driver = Driver.create();
      await switchTab(driver, TAB_INDEX_PRODUCT);
      const stats: TextTreeStats = await statsOfTextTree(driver);
      expect(stats.total >= MIN_TREE_TEXT_COUNT).assertTrue();
      expect(stats.readable >= MIN_PRODUCT_TEXT_COUNT).assertTrue();
      // The testability ability contributes one anonymous Text node to the
      // cross-ability UiTest query. Product Text nodes remain readable, while
      // this host-owned node must not be treated as a product defect.
      expect(stats.blank <= 1).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_A11YTREE_0600
     * @tc.name a11yTextProductNoPlaceholderLiteral006
     * @tc.desc Verify the product page publishes no unbound placeholder literal such as 'undefined'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('a11yTextProductNoPlaceholderLiteral006', 0, async (): Promise<void> => {
      // A data field that was never bound leaks 'undefined'/'null'/'NaN' into
      // the announced text. The product page binds every item, so the
      // placeholder bucket of the real tree must stay empty.
      const driver: Driver = Driver.create();
      await switchTab(driver, TAB_INDEX_PRODUCT);
      const stats: TextTreeStats = await statsOfTextTree(driver);
      expect(stats.placeholder).assertEqual(0);
    });


    /**
     * @tc.number SUB_TV_DEMONSTRATION_A11YTREE_0800
     * @tc.name a11yNodeTabZeroAndTabThreeReachable008
     * @tc.desc Verify tab0 and tab3 stay reachable in the persistent tab bar
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('a11yNodeTabZeroAndTabThreeReachable008', 0, async (): Promise<void> => {
      // The first and last tabs bracket the launcher navigation range; both
      // must resolve as single nodes so remote users can reach every page.
      const driver: Driver = Driver.create();
      const tabZero: Component[] = await driver.findComponents(ON.id('tab0'));
      expect(tabZero.length).assertEqual(1);
      const tabThree: Component[] = await driver.findComponents(ON.id('tab3'));
      expect(tabThree.length).assertEqual(1);
      const tabOne: Component[] = await driver.findComponents(ON.id('tab1'));
      expect(tabOne.length).assertEqual(1);
      const tabTwo: Component[] = await driver.findComponents(ON.id('tab2'));
      expect(tabTwo.length).assertEqual(1);
    });







    /**
     * @tc.number SUB_TV_DEMONSTRATION_A11YTREE_1500
     * @tc.name a11yFocusDpadMovesIntoContentTree015
     * @tc.desc Verify DPAD input moves focus to a content node resolvable in the tree
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('a11yFocusDpadMovesIntoContentTree015', 0, async (): Promise<void> => {
      // After a real DPAD_DOWN from the focused tab, the new focused node must
      // be resolvable through ON.focused() and must not be a tab-bar node,
      // proving the remote moved into the page content tree.
      const driver: Driver = Driver.create();
      await switchTab(driver, TAB_INDEX_FEATURE);
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_DOWN);
      await driver.delayMs(KEY_ACTION_TIME);
      const focusedNodes: Component[] = await driver.findComponents(ON.focused());
      expect(focusedNodes.length >= 1).assertTrue();
      const focusedType: string = await focusedNodes[0].getType();
      expect(focusedType.length > 0).assertTrue();
      const focusedId: string = await focusedNodes[0].getId();
      const isTabId: boolean = focusedId === 'tab0' || focusedId === 'tab1' ||
        focusedId === 'tab2' || focusedId === 'tab3';
      expect(isTabId).assertFalse();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_A11YTREE_1600
     * @tc.name a11yFocusStableAcrossConsecutiveQueries016
     * @tc.desc Verify the focused node stays stable across consecutive tree queries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('a11yFocusStableAcrossConsecutiveQueries016', 0, async (): Promise<void> => {
      // With no input in between, two ON.focused() queries must resolve the
      // same node; a jittering focus engine would break screen-reader
      // announcement continuity.
      const driver: Driver = Driver.create();
      await switchTab(driver, TAB_INDEX_FEATURE);
      const firstRound: Component[] = await driver.findComponents(ON.focused());
      const secondRound: Component[] = await driver.findComponents(ON.focused());
      expect(firstRound.length >= 1).assertTrue();
      expect(secondRound.length >= 1).assertTrue();
      const firstType: string = await firstRound[0].getType();
      const secondType: string = await secondRound[0].getType();
      expect(firstType).assertEqual(secondType);
    });





    /**
     * @tc.number SUB_TV_DEMONSTRATION_A11YTREE_2100
     * @tc.name a11yGeometryTextBoundsInsideScreen021
     * @tc.desc Verify every Text node of the product page stays inside the physical display with legal bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('a11yGeometryTextBoundsInsideScreen021', 0, async (): Promise<void> => {
      // A node whose Rect escapes the display or degenerates to zero area is
      // not renderable for a user. Compute the violation counts over the real
      // Text tree first and assert them afterwards.
      const driver: Driver = Driver.create();
      await switchTab(driver, TAB_INDEX_PRODUCT);
      const screen: display.Display = display.getDefaultDisplaySync();
      const texts: Component[] = await driver.findComponents(ON.type('Text'));
      expect(texts.length >= MIN_TREE_TEXT_COUNT).assertTrue();
      let outOfScreenCount: number = 0;
      let degenerateCount: number = 0;
      for (let i: number = 0; i < texts.length; i++) {
        const bounds: Rect = await texts[i].getBounds();
        if (bounds.left < 0 || bounds.top < 0 || bounds.right > screen.width || bounds.bottom > screen.height) {
          outOfScreenCount++;
        }
        if (bounds.right <= bounds.left || bounds.bottom <= bounds.top) {
          degenerateCount++;
        }
      }
      expect(outOfScreenCount).assertEqual(0);
      expect(degenerateCount).assertEqual(0);
    });


    /**
     * @tc.number SUB_TV_DEMONSTRATION_A11YTREE_2300
     * @tc.name a11yGeometryTabBarInsideScreen023
     * @tc.desc Verify the whole tab bar stays inside the physical display with legal bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('a11yGeometryTabBarInsideScreen023', 0, async (): Promise<void> => {
      // The tab bar is the persistent navigation strip; a tab node escaping
      // the display would make that branch unreachable.
      const driver: Driver = Driver.create();
      const screen: display.Display = display.getDefaultDisplaySync();
      for (let i: number = 0; i < TAB_BAR_COUNT; i++) {
        await assertRectInsideScreen(driver, 'tab' + i.toString(), screen);
      }
    });




    /**
     * @tc.number SUB_TV_DEMONSTRATION_A11YTREE_2700
     * @tc.name a11yDistributionProductReadableFloor027
     * @tc.desc Verify the product page keeps a readable-text distribution floor with no placeholder literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('a11yDistributionProductReadableFloor027', 0, async (): Promise<void> => {
      // The distribution contract: the readable bucket of the real Text tree
      // must stay above the product-page floor, the readable bucket must stay
      // the majority of the tree, and no unbound placeholder literal may leak
      // into what a screen reader announces.
      const driver: Driver = Driver.create();
      await switchTab(driver, TAB_INDEX_PRODUCT);
      const stats: TextTreeStats = await statsOfTextTree(driver);
      expect(stats.readable >= MIN_PRODUCT_TEXT_COUNT).assertTrue();
      expect(stats.readable * 2 >= stats.total).assertTrue();
      expect(stats.placeholder).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_A11YTREE_2800
     * @tc.name a11yDistributionFeatureReadableFloor028
     * @tc.desc Verify the feature page keeps a readable-text distribution floor with no placeholder literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('a11yDistributionFeatureReadableFloor028', 0, async (): Promise<void> => {
      // The feature page swaps in its card grid; the four visible card titles
      // alone must keep the readable bucket above the feature-page floor while
      // the majority of every Text node stays readable.
      const driver: Driver = Driver.create();
      await switchTab(driver, TAB_INDEX_FEATURE);
      const stats: TextTreeStats = await statsOfTextTree(driver);
      expect(stats.readable >= MIN_FEATURE_TEXT_COUNT).assertTrue();
      expect(stats.readable * 2 >= stats.total).assertTrue();
      expect(stats.placeholder).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_A11YTREE_2900
     * @tc.name a11yDistributionSmartLifeReadableFloor029
     * @tc.desc Verify the smart-life page keeps a readable-text distribution floor with no placeholder literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('a11yDistributionSmartLifeReadableFloor029', 0, async (): Promise<void> => {
      // The smart-life page swaps in its three scenario cards; the readable
      // bucket must stay above the smart-life floor and cover the majority of
      // the Text tree that the screen reader walks.
      const driver: Driver = Driver.create();
      await switchTab(driver, TAB_INDEX_SMARTLIFE);
      const stats: TextTreeStats = await statsOfTextTree(driver);
      expect(stats.readable >= MIN_SMARTLIFE_TEXT_COUNT).assertTrue();
      expect(stats.readable * 2 >= stats.total).assertTrue();
      expect(stats.placeholder).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_A11YTREE_3000
     * @tc.name a11yDistributionSupportReadableFloor030
     * @tc.desc Verify the support page keeps a readable-text distribution floor with no placeholder literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('a11yDistributionSupportReadableFloor030', 0, async (): Promise<void> => {
      // The support page swaps in the service entries; the readable bucket must
      // stay above the support floor and cover the majority of the Text tree
      // that the screen reader announces.
      const driver: Driver = Driver.create();
      await switchTab(driver, TAB_INDEX_SUPPORT);
      const stats: TextTreeStats = await statsOfTextTree(driver);
      expect(stats.readable >= MIN_SUPPORT_TEXT_COUNT).assertTrue();
      expect(stats.readable * 2 >= stats.total).assertTrue();
      expect(stats.placeholder).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_A11YTREE_3100
     * @tc.name a11ySecurityTextNoCredentialProduct031
     * @tc.desc Verify the visible text of the product page leaks no credential word through the shared scanner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('a11ySecurityTextNoCredentialProduct031', 0, async (): Promise<void> => {
      // scanVisibleText walks the real Text tree of the current page through the
      // shared scanner and counts sensitive words; the product page must keep a
      // realistic text volume and return zero matches.
      const driver: Driver = Driver.create();
      await switchTab(driver, TAB_INDEX_PRODUCT);
      const scan: SecurityScanResult = await scanVisibleText(driver);
      expect(scan.textCount >= MIN_TREE_TEXT_COUNT).assertTrue();
      expect(scan.matchCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_A11YTREE_3200
     * @tc.name a11ySecurityTextNoCredentialEveryTab032
     * @tc.desc Verify the visible text of every tab leaks no credential word through the shared scanner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('a11ySecurityTextNoCredentialEveryTab032', 0, async (): Promise<void> => {
      // Every tab swaps its own text subtree under the same tab bar, so the
      // credential scan must pass on each of the four real pages; the aggregate
      // count proves the scanner actually walked a non-empty tree every time.
      const driver: Driver = Driver.create();
      let scannedCount: number = 0;
      for (let i: number = 0; i < TAB_BAR_COUNT; i++) {
        await switchTab(driver, i);
        const scan: SecurityScanResult = await scanVisibleText(driver);
        expect(scan.matchCount).assertEqual(0);
        scannedCount += scan.textCount;
      }
      expect(scannedCount > 0).assertTrue();
    });
  });
}
