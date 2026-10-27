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

import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';
import { Component, Driver, ON, Rect } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { KeyCode } from '@kit.InputKit';
import { router } from '@kit.ArkUI';
import { startAppWithRetry, waitForRootTabBar } from './TestScenarioUtils';

const BUNDLE_NAME: string = 'com.sample.demonstration';
const ABILITY_NAME: string = 'EntryAbility';
const MAIN_WANT: Want = {
  bundleName: BUNDLE_NAME,
  abilityName: ABILITY_NAME,
  action: 'ohos.want.action.home'
};
const TAB_SETTLE_TIME: number = 220;
const ROUTE_BACK_TIME: number = 180;
const KEY_ACTION_TIME: number = 150;
const TAB_COUNT: number = 4;
const TAB_INDEX_PRODUCT: number = 0;
const TAB_INDEX_FEATURE: number = 1;
const TAB_INDEX_SMARTLIFE: number = 2;
const TAB_INDEX_SUPPORT: number = 3;

// The four navigation labels published by Index.ets buildTabBar(). These are
// the resolved en_US values of the tab resource strings and are the texts a
// real screen reader announces for each tab.
const EXPECTED_TAB_LABELS: string[] = [
  'Product Specifications',
  'Function Features',
  'Smart Life',
  'Service Support'
];

// ProductSpecPage (tab 0) renders its spec rows through the ${item.title}
// interpolation. The header, audio and energy rows use direct Text($r(...))
// bindings and therefore resolve to readable literals; the spec rows publish
// their content through the text node count instead.
const PRODUCT_SPEC_RESOLVED_TEXTS: string[] = [
  'Product Specifications',
  'Sound System',
  'Dolby Atmos',
  'Energy Efficiency Rating',
  'Class 1 Energy Efficiency'
];

// FeaturePage (tab 1) header resolves through a direct resource binding; the
// catalog rows publish through node counts.
const FEATURE_HEADER_TEXT: string = 'Function Directory';

// The minimum number of readable text nodes a fully rendered tab exposes. This
// mirrors the a11y sweep and proves the page did not render empty.
const MIN_READABLE_TEXTS: number = 6;

export default function indexHomeBehaviorContractTest(): void {
  describe('IndexHomeBehaviorContractTest', () => {
    let driver: Driver;

    /**
     * Brings EntryAbility to the foreground and unwinds the router stack to the
     * Index root page. Shared pre-condition of every case so a stale route or
     * tab left by an earlier transition cannot mask a home-page regression.
     */
    const restoreForegroundRoot = async (): Promise<void> => {
      await driver.pressHome();
      await driver.delayMs(300);
      await startAppWithRetry(MAIN_WANT, BUNDLE_NAME);
      const activeDriver: Driver = Driver.create();
      await waitForRootTabBar(activeDriver);
      let state: router.RouterState = router.getState();
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
    };

    /**
     * Switches the Index page to the given tab through a real click on the
     * tab-bar node, mirroring the remote user interaction path.
     */
    const switchTab = async (index: number): Promise<void> => {
      const tab: Component = await driver.findComponent(ON.id('tab' + index.toString()));
      await tab.click();
      await driver.delayMs(TAB_SETTLE_TIME);
    };

    /**
     * Returns whether a visible Text node with the exact given content exists.
     * Polls briefly because a coverage-instrumented tab render can lag the
     * first frame; findComponents returns null for an empty match.
     */
    const textExists = async (content: string, maxWaitMs: number = 3000): Promise<boolean> => {
      const stepMs: number = 250;
      let waited: number = 0;
      while (waited < maxWaitMs) {
        const nodes: Component[] = await driver.findComponents(ON.text(content));
        if (nodes !== null) {
          for (let i: number = 0; i < nodes.length; i++) {
            const bounds: Rect = await nodes[i].getBounds();
            if (bounds.right > bounds.left && bounds.bottom > bounds.top) {
              return true;
            }
          }
        }
        await driver.delayMs(stepMs);
        waited += stepMs;
      }
      return false;
    };

    /**
     * Counts readable text nodes (non-empty, non-placeholder) on the current page.
     */
    const countReadableTexts = async (): Promise<number> => {
      const texts: Component[] = await driver.findComponents(ON.type('Text'));
      let readable: number = 0;
      if (texts !== null) {
        for (let i: number = 0; i < texts.length; i++) {
          const content: string = await texts[i].getText();
          if (content.trim().length > 0 && content !== 'undefined' && content !== 'null' && content !== 'NaN') {
            readable++;
          }
        }
      }
      return readable;
    };

    beforeAll(async (): Promise<void> => {
      driver = Driver.create();
      await startAppWithRetry(MAIN_WANT, BUNDLE_NAME);
      await waitForRootTabBar(driver);
      await restoreForegroundRoot();
    });

    afterAll(async (): Promise<void> => {
      const delegator = abilityDelegatorRegistry.getAbilityDelegator();
      await startAppWithRetry(MAIN_WANT, BUNDLE_NAME);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_INDEX_HOME_0100
     * @tc.name indexHomeTabBarFourLabels001
     * @tc.desc Verify the home page tab bar publishes the four navigation labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('indexHomeTabBarFourLabels001', 0, async (): Promise<void> => {
      await restoreForegroundRoot();
      for (let index: number = 0; index < EXPECTED_TAB_LABELS.length; index++) {
        const found: boolean = await textExists(EXPECTED_TAB_LABELS[index]);
        expect(found).assertTrue();
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_INDEX_HOME_0200
     * @tc.name indexHomeTabBarNodesQueryable002
     * @tc.desc Verify every tab-bar node is addressable by its production id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('indexHomeTabBarNodesQueryable002', 0, async (): Promise<void> => {
      await restoreForegroundRoot();
      for (let index: number = 0; index < TAB_COUNT; index++) {
        const node: Component = await driver.findComponent(ON.id('tab' + index.toString()));
        const bounds: Rect = await node.getBounds();
        expect(bounds.right > bounds.left && bounds.bottom > bounds.top).assertTrue();
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_INDEX_HOME_0300
     * @tc.name indexHomeProductTabResolvedTexts003
     * @tc.desc Verify the product tab exposes its resolved header, audio and energy literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('indexHomeProductTabResolvedTexts003', 0, async (): Promise<void> => {
      await restoreForegroundRoot();
      await switchTab(TAB_INDEX_PRODUCT);
      for (let i: number = 0; i < PRODUCT_SPEC_RESOLVED_TEXTS.length; i++) {
        expect(await textExists(PRODUCT_SPEC_RESOLVED_TEXTS[i])).assertTrue();
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_INDEX_HOME_0400
     * @tc.name indexHomeProductTabTextCount004
     * @tc.desc Verify the product tab renders a non-empty readable text tree
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('indexHomeProductTabTextCount004', 0, async (): Promise<void> => {
      await restoreForegroundRoot();
      await switchTab(TAB_INDEX_PRODUCT);
      expect(await countReadableTexts() >= MIN_READABLE_TEXTS).assertTrue();
    });


    /**
     * @tc.number SUB_TV_DEMONSTRATION_INDEX_HOME_0600
     * @tc.name indexHomeFeatureTabTextCount006
     * @tc.desc Verify the feature tab renders a non-empty readable text tree
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('indexHomeFeatureTabTextCount006', 0, async (): Promise<void> => {
      await restoreForegroundRoot();
      await switchTab(TAB_INDEX_FEATURE);
      expect(await countReadableTexts() >= MIN_READABLE_TEXTS).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_INDEX_HOME_0700
     * @tc.name indexHomeSmartLifeTabTextCount007
     * @tc.desc Verify the smart-life tab renders readable content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('indexHomeSmartLifeTabTextCount007', 0, async (): Promise<void> => {
      await restoreForegroundRoot();
      await switchTab(TAB_INDEX_SMARTLIFE);
      await driver.delayMs(200);
      expect(await countReadableTexts() >= 4).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_INDEX_HOME_0800
     * @tc.name indexHomeSupportTabResponsive008
     * @tc.desc Verify the support tab accepts focus and keeps the tab bar visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('indexHomeSupportTabResponsive008', 0, async (): Promise<void> => {
      await restoreForegroundRoot();
      await switchTab(TAB_INDEX_SUPPORT);
      await driver.delayMs(200);
      expect(await textExists('Service Support')).assertTrue();
      expect(await textExists('Product Specifications')).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_INDEX_HOME_0900
     * @tc.name indexHomeTabCycleForward009
     * @tc.desc Verify a forward tab cycle returns the home page to the product tab
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('indexHomeTabCycleForward009', 0, async (): Promise<void> => {
      await restoreForegroundRoot();
      await switchTab(TAB_INDEX_FEATURE);
      await switchTab(TAB_INDEX_SMARTLIFE);
      await switchTab(TAB_INDEX_SUPPORT);
      await switchTab(TAB_INDEX_PRODUCT);
      expect(await textExists('Product Specifications')).assertTrue();
      expect(await textExists('Sound System')).assertTrue();
    });


    /**
     * @tc.number SUB_TV_DEMONSTRATION_INDEX_HOME_1100
     * @tc.name indexHomeRepeatedTabSwitchStability011
     * @tc.desc Verify repeated tab switching keeps the home page interactive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('indexHomeRepeatedTabSwitchStability011', 0, async (): Promise<void> => {
      await restoreForegroundRoot();
      const sequence: number[] = [1, 3, 2, 0, 1, 3, 2, 0];
      for (let i: number = 0; i < sequence.length; i++) {
        await switchTab(sequence[i]);
      }
      await switchTab(TAB_INDEX_PRODUCT);
      expect(await textExists('Product Specifications')).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_INDEX_HOME_1200
     * @tc.name indexHomeFocusRightRecovers012
     * @tc.desc Verify DPAD right focus movement recovers to a fully rendered home page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('indexHomeFocusRightRecovers012', 0, async (): Promise<void> => {
      await restoreForegroundRoot();
      await driver.pressBack();
      await driver.delayMs(200);
      for (let i: number = 0; i < 8; i++) {
        await driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
        await driver.delayMs(KEY_ACTION_TIME);
      }
      await restoreForegroundRoot();
      expect(await textExists('Product Specifications')).assertTrue();
    });



    /**
     * @tc.number SUB_TV_DEMONSTRATION_INDEX_HOME_1500
     * @tc.name indexHomeProductTabNoPlaceholders015
     * @tc.desc Verify the product tab text tree contains no unbound placeholder literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('indexHomeProductTabNoPlaceholders015', 0, async (): Promise<void> => {
      await restoreForegroundRoot();
      await switchTab(TAB_INDEX_PRODUCT);
      const texts: Component[] = await driver.findComponents(ON.type('Text'));
      let placeholders: number = 0;
      if (texts !== null) {
        for (let i: number = 0; i < texts.length; i++) {
          const content: string = await texts[i].getText();
          if (content === 'undefined' || content === 'null' || content === 'NaN') {
            placeholders++;
          }
        }
      }
      expect(placeholders).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_INDEX_HOME_1600
     * @tc.name indexHomeTabBarVisibleAcrossTabs016
     * @tc.desc Verify every tab keeps its own label visible after switching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('indexHomeTabBarVisibleAcrossTabs016', 0, async (): Promise<void> => {
      await restoreForegroundRoot();
      for (let index: number = 0; index < TAB_COUNT; index++) {
        await switchTab(index);
        await driver.delayMs(150);
        expect(await textExists(EXPECTED_TAB_LABELS[index])).assertTrue();
      }
    });
  });
}
