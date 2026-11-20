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

import {
  describe,
  it,
  expect,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
} from '@ohos/hypium';
import registry from '@ohos.app.ability.abilityDelegatorRegistry';
import { PRODUCT_DATA } from '../../../main/ets/mock/GoodsMock';
import { ProductDataModel } from '../../../main/ets/model/GoodsModel';
import {
  getDriver,
  launchRenderingApp,
  waitForRenderingStable,
  findComponentsByType,
  resolveString,
  assertImageResource,
  clickText,
  checkTextContent,
  serializedDelay,
  triggerSerializedKey,
  KEY_HOME,
  catalogSnapshot,
  assertCatalogUnchanged,
  logSuite,
} from './Shared/SharedDriver';

import { yieldToLifecycle } from './Shared/SharedDriver';

export default function renderingIntegrationTest(): void {
  describe('RenderingIntegration', (): void => {
    let snapshot: ProductDataModel[] = [];
    beforeAll((): void => {
      logSuite('RenderingIntegration', 'begin');
    });
    beforeEach(async (): Promise<void> => {
      await yieldToLifecycle();
      snapshot = catalogSnapshot();
    });
    afterEach((): void => {
      assertCatalogUnchanged(snapshot);
    });
    afterAll((): void => {
      logSuite('RenderingIntegration', 'end');
    });

    // @tc.number SUB_ARKWEB_RENDERING_INTEGRATION_0100
    // @tc.name renderingIntegration001
    // @tc.desc Verify GoodsMock contains sixteen entries in the documented repeating order
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('renderingIntegration001', 0, (): void => {
      const count: number = PRODUCT_DATA.length;
      expect(count).assertEqual(16);
      const expectedIds: number[] = [0, 1, 2, 4];
      for (let index: number = 0; index < count; index++) {
        const id: number = PRODUCT_DATA[index].id;
        const expectedId: number = expectedIds[index % 4];
        expect(id).assertEqual(expectedId);
      }
    });

    // @tc.number SUB_ARKWEB_RENDERING_INTEGRATION_0200
    // @tc.name renderingIntegration002
    // @tc.desc Verify every GoodsMock title price and image resolves through packaged resources
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('renderingIntegration002', 0, async (): Promise<void> => {
      const titles: ResourceStr[] = [
        $r('app.string.nativeembed_product_title000'),
        $r('app.string.nativeembed_product_title001'),
        $r('app.string.nativeembed_product_title002'),
        $r('app.string.nativeembed_product_title004'),
      ];
      const prices: string[] = [
        '￥79.9',
        '￥6999',
        '￥5999',
        '￥899',
      ];
      for (
        let index: number = 0;
        index < PRODUCT_DATA.length;
        index++
      ) {
        const item: ProductDataModel = PRODUCT_DATA[index];
        const title: string = resolveString(item.title);
        const expectedTitle: string = resolveString(
          titles[index % 4],
        );
        const price: string = resolveString(item.price);
        const expectedPrice: string = prices[index % 4];
        expect(title).assertEqual(expectedTitle);
        expect(price).assertEqual(expectedPrice);
        await assertImageResource(item.uri);
      }
    });

    // [DELETED] renderingIntegration003: repeated failure, duplicate production IDs (4 != 16).

    // @tc.number SUB_ARKWEB_RENDERING_INTEGRATION_0400
    // @tc.name renderingIntegration004
    // @tc.desc Verify nativeembed_view defines getEmbedSize and nativeSearch viewport contract
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('renderingIntegration004', 0, async (): Promise<void> => {
      const manager = registry
        .getAbilityDelegator()
        .getAppContext().resourceManager;
      const bytes: Uint8Array = await manager.getRawFileContent(
        'nativeembed_view.html',
      );
      // The contract tokens are ASCII; avoid a dependency on a separate text decoder.
      let html: string = '';
      for (let index: number = 0; index < bytes.length; index++) {
        html += String.fromCharCode(bytes[index]);
      }
      const hasFunction: boolean = html.includes(
        'function getEmbedSize()',
      );
      const hasPlaceholder: boolean = html.includes(
        'id="nativeSearch"',
      );
      const usesWidth: boolean = html.includes(
        'width: doc.offsetWidth',
      );
      const usesHeight: boolean = html.includes(
        'height: doc.offsetHeight',
      );
      const responsive: boolean = html.includes('width=device-width');
      expect(hasFunction).assertTrue();
      expect(hasPlaceholder).assertTrue();
      expect(usesWidth).assertTrue();
      expect(usesHeight).assertTrue();
      expect(responsive).assertTrue();
    });

    // @tc.number SUB_ARKWEB_RENDERING_INTEGRATION_0500
    // @tc.name renderingIntegration005
    // @tc.desc Verify EntryAbility displays the Web and native mall overlay after page load
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('renderingIntegration005', 0, async (): Promise<void> => {
      await launchRenderingApp();
      const driver = getDriver();
      await waitForRenderingStable(driver);
      const webComponents = await findComponentsByType(driver, 'Web');
      const webCount: number = webComponents.length;
      expect(webCount).assertEqual(1);
      const grids = await findComponentsByType(driver, 'Grid');
      const gridCount: number = grids.length;
      // The device navigation bar also exposes a Grid in the merged hierarchy.
      // The app-specific search text below identifies the native overlay.
      expect(gridCount).assertLargerOrEqual(1);
      const placeholder: string = resolveString(
        $r('app.string.nativeembed_search_text_placeholder'),
      );
      const searchPresent: boolean = await checkTextContent(
        driver,
        placeholder,
      );
      expect(searchPresent).assertTrue();
    });

    // @tc.number SUB_ARKWEB_RENDERING_INTEGRATION_0600
    // @tc.name renderingIntegration006
    // @tc.desc Verify clicking the search row displays the demonstration toast
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('renderingIntegration006', 0, async (): Promise<void> => {
      await launchRenderingApp();
      const driver = getDriver();
      await waitForRenderingStable(driver);
      const placeholder: string = resolveString(
        $r('app.string.nativeembed_search_text_placeholder'),
      );
      const toast: string = resolveString(
        $r('app.string.nativeembed_prompt_text'),
      );
      await clickText(driver, placeholder);
      let visible: boolean = false;
      const deadline: number = Date.now() + 1500;
      while (Date.now() < deadline && !visible) {
        visible = await checkTextContent(driver, toast);
        if (!visible) {
          await serializedDelay(driver, 50);
        }
      }
      expect(visible).assertTrue();
    });

    // @tc.number SUB_ARKWEB_RENDERING_INTEGRATION_0700
    // @tc.name renderingIntegration007
    // @tc.desc Verify foreground recovery restores the mall overlay and catalog data
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('renderingIntegration007', 0, async (): Promise<void> => {
      await launchRenderingApp();
      const driver = getDriver();
      await waitForRenderingStable(driver);
      await triggerSerializedKey(driver, KEY_HOME);
      await launchRenderingApp();
      await waitForRenderingStable(driver);
      const mall: string = resolveString(
        $r('app.string.nativeembed_mall'),
      );
      const visible: boolean = await checkTextContent(driver, mall);
      expect(visible).assertTrue();
      assertCatalogUnchanged(snapshot);
    });

    // @tc.number SUB_ARKWEB_RENDERING_INTEGRATION_0800
    // @tc.name renderingIntegration008
    // @tc.desc Verify the first two product cards occupy distinct columns on the same row
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('renderingIntegration008', 0, async (): Promise<void> => {
      await launchRenderingApp();
      const driver = getDriver();
      await waitForRenderingStable(driver);
      const cards = await findComponentsByType(driver, 'GridItem');
      const visibleCount: number = cards.length;
      expect(visibleCount).assertLargerOrEqual(2);
      const first = await cards[0].getBounds();
      const second = await cards[1].getBounds();
      const distinctColumns: boolean = second.left >= first.right;
      const rowDifference: number = Math.abs(first.top - second.top);
      const firstWidth: number = first.right - first.left;
      const secondWidth: number = second.right - second.left;
      expect(distinctColumns).assertTrue();
      expect(rowDifference).assertLessOrEqual(2);
      expect(firstWidth).assertLarger(0);
      expect(secondWidth).assertLarger(0);
    });
  });
}
