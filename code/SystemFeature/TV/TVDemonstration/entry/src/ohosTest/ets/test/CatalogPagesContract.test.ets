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
import Want from '@ohos.app.ability.Want';
import { KeyCode } from '@kit.InputKit';
import { startAppWithRetry, waitForComponentById, waitForText } from './TestScenarioUtils';


const CATALOG_PAGES_WANT: Want = {
  bundleName: 'com.sample.demonstration',
  abilityName: 'EntryAbility',
  action: 'ohos.want.action.home'
};

/**
 * UiTest may hand back null instead of an empty array when a selector matches
 * nothing (for example while the tree is being rebuilt between tabs). Counting
 * through this helper keeps such a miss an assertion failure instead of a
 * "Cannot read property length of null" crash.
 */
function nodeCount(nodes: Component[] | null): number {
  return nodes === null ? 0 : nodes.length;
}

export default function catalogPagesContractTest(): void {

  describe('ProductSpecTest', () => {
    let driver: Driver;

    const openProductTab = async (): Promise<void> => {
      const productTab: Component = await driver.findComponent(ON.id('tab0'));
      await productTab.click();
      await driver.delayMs(150);
    };

    beforeAll(async (): Promise<void> => {
      await Driver.create().pressHome();
      await Driver.create().delayMs(300);
      await startAppWithRetry(CATALOG_PAGES_WANT, 'com.sample.demonstration');
      driver = Driver.create();
      await driver.delayMs(1500);
      await openProductTab();
    });

    beforeEach(async (): Promise<void> => {
      // Returning through the public tab interaction resets the page to the same
      // business state while preserving real ArkUI rendering and device data.
      const productTab: Component = await driver.findComponent(ON.id('tab0'));
      await productTab.click();
      await driver.delayMs(100);
    });

    afterEach(async (): Promise<void> => {
      await driver.delayMs(50);
    });

    afterAll(async (): Promise<void> => {
      await driver.pressHome();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_PRODUCT_0100
     * @tc.name productTitleVisible001
     * @tc.desc Verify ProductSpecPage renders its title beside the persistent product tab label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('productTitleVisible001', 0, async (): Promise<void> => {
      // 'Product Specifications' is both the page title and the always-mounted
      // tab0 label (Index.ets tabs[0]), so exactly two nodes exist on this page
      // and only the tab label remains on every other page.
      const titleNodes: Component[] = await driver.findComponents(ON.text('Product Specifications'));
      expect(titleNodes.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_PRODUCT_0200
     * @tc.name productScreenSizeLabel002
     * @tc.desc Verify ProductSpecPage exposes the complete specification label catalog
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('productScreenSizeLabel002', 0, async (): Promise<void> => {
      // All eight labels come from one production ForEach/row contract, so they
      // are asserted as one aggregate catalog instead of one case per string.
      const labels: string[] = ['Screen Size', 'Display Technology', 'Operating System',
        'Memory Configuration', 'Processor', 'Interface Configuration', 'Sound System',
        'Energy Efficiency Rating'];
      for (let index: number = 0; index < labels.length; index++) {
        const nodes: Component[] = await driver.findComponents(ON.text(labels[index]));
        expect(nodes.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_PRODUCT_0300
     * @tc.name productOperatingSystem004
     * @tc.desc Verify ProductSpecPage renders the complete specification value catalog
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('productOperatingSystem004', 0, async (): Promise<void> => {
      // These six values are shared by both device datasets (product_6780 and
      // product_6320), so the aggregate contract is model independent. The OS
      // value follows string.json ('OpenHarmony 5.1'), not a truncated prefix.
      const values: string[] = ['OpenHarmony 5.1', 'MiniLED Full Array Backlight', '4GB+64GB',
        'HDMI 2.1', 'Dolby Atmos', 'Class 1 Energy Efficiency'];
      for (let index: number = 0; index < values.length; index++) {
        const nodes: Component[] = await driver.findComponents(ON.text(values[index]));
        expect(nodes.length).assertEqual(1);
      }
    });


    /**
     * @tc.number SUB_TV_DEMONSTRATION_PRODUCT_0500
     * @tc.name productDividerPopulation012
     * @tc.desc Verify ProductSpecPage separates specification groups with dividers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('productDividerPopulation012', 0, async (): Promise<void> => {
      // Three dividers correspond to the three ForEach rows of the production spec list.
      const dividers: Component[] = await driver.findComponents(ON.type('Divider'));
      expect(dividers.length).assertEqual(3);
    });



    /**
     * @tc.number SUB_TV_DEMONSTRATION_PRODUCT_0800
     * @tc.name productNoEmptyText021
     * @tc.desc Verify ProductSpecPage does not expose empty text a11y nodes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('productNoEmptyText021', 0, async (): Promise<void> => {
      const texts: Component[] = await driver.findComponents(ON.type('Text'));
      let emptyCount: number = 0;
      for (let index: number = 0; index < texts.length; index++) {
        const value: string = await texts[index].getText();
        if (value.length === 0) {
          emptyCount++;
        }
      }
      expect(emptyCount).assertEqual(0);
    });


    /**
     * @tc.number SUB_TV_DEMONSTRATION_PRODUCT_1000
     * @tc.name productTabPersistence024
     * @tc.desc Verify ProductSpecPage tab remains available after content assertions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('productTabPersistence024', 0, async (): Promise<void> => {
      const productTab: Component = await driver.findComponent(ON.id('tab0'));
      expect(await productTab.getText()).assertEqual('Product Specifications');
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_PRODUCT_1100
     * @tc.name productRapidReturn022
     * @tc.desc Verify ProductSpecPage survives high frequency navigation without losing fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('productRapidReturn022', 0, async (): Promise<void> => {
      // This assertion observes rendered application state rather than a copied
      // fixture, so model selection and ArkUI binding failures remain visible.
      for (let index: number = 0; index < 10; index++) {
        await (await driver.findComponent(ON.id('tab1'))).click();
        await (await driver.findComponent(ON.id('tab0'))).click();
      }
      await driver.assertComponentExist(ON.text('Energy Efficiency Rating'));
    });
  });

  ;
}
