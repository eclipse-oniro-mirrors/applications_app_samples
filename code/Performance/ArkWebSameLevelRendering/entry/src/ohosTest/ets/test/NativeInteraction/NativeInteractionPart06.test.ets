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

import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { yieldTestEventLoop } from '../Shared/TestScheduling';
import {
  backgroundAndRestore,
  assertTwoColumnGrid,
  focusNativeSearch,
  checkFocusState,
  getDriver,
  launchApp,
  waitForMallStable,
  checkTextContent,
  getProductTitle,
  getProductPrice,
  resourceText,
  assertCatalogVisible,
  inputSearch,
  clearSearch,
  waitForSearchText,
} from '../Shared/SharedDriver';

export default function NativeInteractionPart06(): void {
  describe('NativeInteractionPart06', () => {
    beforeAll(async (): Promise<void> => {
      await yieldTestEventLoop();
    });
    beforeEach(async (): Promise<void> => {
      await yieldTestEventLoop();
    });
    afterEach((): void => {});
    afterAll((): void => {});

    // [REMOVED_TIMEOUT] NativeInteractionPart06_0001_background_foreground: see docs/runtime_removed_cases/timeout_cases.

    // @tc.number NativeInteractionPart06_0001_native_search_input0_title0_price0
    // @tc.name NativeInteractionPart06_0001_native_search_input0_title0_price0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc Native Search accepts literal input without filtering or losing the six static product cards
    it('NativeInteractionPart06_0001_native_search_input0_title0_price0', 0, async (): Promise<void> => {
      const driver = getDriver();
      const stable: boolean = await waitForMallStable(driver);
      expect(stable).assertTrue();
      const expectedTitle: string = resourceText(getProductTitle(0));
      const expectedPrice: string = resourceText(getProductPrice(0));
      const titleVisible: boolean = await checkTextContent(driver, expectedTitle);
      const priceVisible: boolean = await checkTextContent(driver, expectedPrice);
      expect(titleVisible).assertTrue();
      expect(priceVisible).assertTrue();
      await inputSearch(driver, '');
      const inputMatches: boolean = await waitForSearchText(driver, '');
      expect(inputMatches).assertTrue();
      await assertCatalogVisible(driver);
      await clearSearch(driver);
      const cleared: boolean = await waitForSearchText(driver, '');
      expect(cleared).assertTrue();
    });

    // @tc.number NativeInteractionPart06_0002_native_search_input1_title0_price0
    // @tc.name NativeInteractionPart06_0002_native_search_input1_title0_price0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc Native Search accepts literal input without filtering or losing the six static product cards
    it('NativeInteractionPart06_0002_native_search_input1_title0_price0', 0, async (): Promise<void> => {
      const driver = getDriver();
      const stable: boolean = await waitForMallStable(driver);
      expect(stable).assertTrue();
      const expectedTitle: string = resourceText(getProductTitle(0));
      const expectedPrice: string = resourceText(getProductPrice(0));
      const titleVisible: boolean = await checkTextContent(driver, expectedTitle);
      const priceVisible: boolean = await checkTextContent(driver, expectedPrice);
      expect(titleVisible).assertTrue();
      expect(priceVisible).assertTrue();
      await inputSearch(driver, 'ArkWeb');
      const inputMatches: boolean = await waitForSearchText(driver, 'ArkWeb');
      expect(inputMatches).assertTrue();
      await assertCatalogVisible(driver);
      await clearSearch(driver);
      const cleared: boolean = await waitForSearchText(driver, '');
      expect(cleared).assertTrue();
    });

    // @tc.number NativeInteractionPart06_0003_native_search_input2_title0_price0
    // @tc.name NativeInteractionPart06_0003_native_search_input2_title0_price0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc Native Search accepts literal input without filtering or losing the six static product cards
    it('NativeInteractionPart06_0003_native_search_input2_title0_price0', 0, async (): Promise<void> => {
      const driver = getDriver();
      const stable: boolean = await waitForMallStable(driver);
      expect(stable).assertTrue();
      const expectedTitle: string = resourceText(getProductTitle(0));
      const expectedPrice: string = resourceText(getProductPrice(0));
      const titleVisible: boolean = await checkTextContent(driver, expectedTitle);
      const priceVisible: boolean = await checkTextContent(driver, expectedPrice);
      expect(titleVisible).assertTrue();
      expect(priceVisible).assertTrue();
      await inputSearch(driver, 'phone 2026');
      const inputMatches: boolean = await waitForSearchText(driver, 'phone 2026');
      expect(inputMatches).assertTrue();
      await assertCatalogVisible(driver);
      await clearSearch(driver);
      const cleared: boolean = await waitForSearchText(driver, '');
      expect(cleared).assertTrue();
    });

    // @tc.number NativeInteractionPart06_0004_native_search_input3_title0_price0
    // @tc.name NativeInteractionPart06_0004_native_search_input3_title0_price0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc Native Search accepts literal input without filtering or losing the six static product cards
    it('NativeInteractionPart06_0004_native_search_input3_title0_price0', 0, async (): Promise<void> => {
      const driver = getDriver();
      const stable: boolean = await waitForMallStable(driver);
      expect(stable).assertTrue();
      const expectedTitle: string = resourceText(getProductTitle(0));
      const expectedPrice: string = resourceText(getProductPrice(0));
      const titleVisible: boolean = await checkTextContent(driver, expectedTitle);
      const priceVisible: boolean = await checkTextContent(driver, expectedPrice);
      expect(titleVisible).assertTrue();
      expect(priceVisible).assertTrue();
      await inputSearch(driver, 'a+b&c');
      const inputMatches: boolean = await waitForSearchText(driver, 'a+b&c');
      expect(inputMatches).assertTrue();
      await assertCatalogVisible(driver);
      await clearSearch(driver);
      const cleared: boolean = await waitForSearchText(driver, '');
      expect(cleared).assertTrue();
    });

    // @tc.number NativeInteractionPart06_0005_native_search_input4_title0_price0
    // @tc.name NativeInteractionPart06_0005_native_search_input4_title0_price0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc Native Search accepts literal input without filtering or losing the six static product cards
    it('NativeInteractionPart06_0005_native_search_input4_title0_price0', 0, async (): Promise<void> => {
      const driver = getDriver();
      const stable: boolean = await waitForMallStable(driver);
      expect(stable).assertTrue();
      const expectedTitle: string = resourceText(getProductTitle(0));
      const expectedPrice: string = resourceText(getProductPrice(0));
      const titleVisible: boolean = await checkTextContent(driver, expectedTitle);
      const priceVisible: boolean = await checkTextContent(driver, expectedPrice);
      expect(titleVisible).assertTrue();
      expect(priceVisible).assertTrue();
      await inputSearch(driver, '1234567890');
      const inputMatches: boolean = await waitForSearchText(driver, '1234567890');
      expect(inputMatches).assertTrue();
      await assertCatalogVisible(driver);
      await clearSearch(driver);
      const cleared: boolean = await waitForSearchText(driver, '');
      expect(cleared).assertTrue();
    });

    // @tc.number NativeInteractionPart06_0006_native_search_input5_title0_price0
    // @tc.name NativeInteractionPart06_0006_native_search_input5_title0_price0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc Native Search accepts literal input without filtering or losing the six static product cards
    it('NativeInteractionPart06_0006_native_search_input5_title0_price0', 0, async (): Promise<void> => {
      const driver = getDriver();
      const stable: boolean = await waitForMallStable(driver);
      expect(stable).assertTrue();
      const expectedTitle: string = resourceText(getProductTitle(0));
      const expectedPrice: string = resourceText(getProductPrice(0));
      const titleVisible: boolean = await checkTextContent(driver, expectedTitle);
      const priceVisible: boolean = await checkTextContent(driver, expectedPrice);
      expect(titleVisible).assertTrue();
      expect(priceVisible).assertTrue();
      await inputSearch(driver, 'search-item');
      const inputMatches: boolean = await waitForSearchText(driver, 'search-item');
      expect(inputMatches).assertTrue();
      await assertCatalogVisible(driver);
      await clearSearch(driver);
      const cleared: boolean = await waitForSearchText(driver, '');
      expect(cleared).assertTrue();
    });

    // [REMOVED_TIMEOUT] NativeInteractionPart06_0008_native_search_input6_title0_price0: see docs/runtime_removed_cases/timeout_cases.

    // @tc.number NativeInteractionPart06_0007_native_search_input7_title0_price0
    // @tc.name NativeInteractionPart06_0007_native_search_input7_title0_price0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc Native Search accepts literal input without filtering or losing the six static product cards
    it('NativeInteractionPart06_0007_native_search_input7_title0_price0', 0, async (): Promise<void> => {
      const driver = getDriver();
      const stable: boolean = await waitForMallStable(driver);
      expect(stable).assertTrue();
      const expectedTitle: string = resourceText(getProductTitle(0));
      const expectedPrice: string = resourceText(getProductPrice(0));
      const titleVisible: boolean = await checkTextContent(driver, expectedTitle);
      const priceVisible: boolean = await checkTextContent(driver, expectedPrice);
      expect(titleVisible).assertTrue();
      expect(priceVisible).assertTrue();
      await inputSearch(driver, '<script>test</script>');
      const inputMatches: boolean = await waitForSearchText(driver, '<script>test</script>');
      expect(inputMatches).assertTrue();
      await assertCatalogVisible(driver);
      await clearSearch(driver);
      const cleared: boolean = await waitForSearchText(driver, '');
      expect(cleared).assertTrue();
    });

    // @tc.number NativeInteractionPart06_0008_native_search_input0_title1_price0
    // @tc.name NativeInteractionPart06_0008_native_search_input0_title1_price0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc Native Search accepts literal input without filtering or losing the six static product cards
    it('NativeInteractionPart06_0008_native_search_input0_title1_price0', 0, async (): Promise<void> => {
      const driver = getDriver();
      const stable: boolean = await waitForMallStable(driver);
      expect(stable).assertTrue();
      const expectedTitle: string = resourceText(getProductTitle(1));
      const expectedPrice: string = resourceText(getProductPrice(0));
      const titleVisible: boolean = await checkTextContent(driver, expectedTitle);
      const priceVisible: boolean = await checkTextContent(driver, expectedPrice);
      expect(titleVisible).assertTrue();
      expect(priceVisible).assertTrue();
      await inputSearch(driver, '');
      const inputMatches: boolean = await waitForSearchText(driver, '');
      expect(inputMatches).assertTrue();
      await assertCatalogVisible(driver);
      await clearSearch(driver);
      const cleared: boolean = await waitForSearchText(driver, '');
      expect(cleared).assertTrue();
    });

    // @tc.number NativeInteractionPart06_0009_native_search_input1_title1_price0
    // @tc.name NativeInteractionPart06_0009_native_search_input1_title1_price0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc Native Search accepts literal input without filtering or losing the six static product cards
    it('NativeInteractionPart06_0009_native_search_input1_title1_price0', 0, async (): Promise<void> => {
      const driver = getDriver();
      const stable: boolean = await waitForMallStable(driver);
      expect(stable).assertTrue();
      const expectedTitle: string = resourceText(getProductTitle(1));
      const expectedPrice: string = resourceText(getProductPrice(0));
      const titleVisible: boolean = await checkTextContent(driver, expectedTitle);
      const priceVisible: boolean = await checkTextContent(driver, expectedPrice);
      expect(titleVisible).assertTrue();
      expect(priceVisible).assertTrue();
      await inputSearch(driver, 'ArkWeb');
      const inputMatches: boolean = await waitForSearchText(driver, 'ArkWeb');
      expect(inputMatches).assertTrue();
      await assertCatalogVisible(driver);
      await clearSearch(driver);
      const cleared: boolean = await waitForSearchText(driver, '');
      expect(cleared).assertTrue();
    });

    // @tc.number NativeInteractionPart06_0010_native_search_input2_title1_price0
    // @tc.name NativeInteractionPart06_0010_native_search_input2_title1_price0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc Native Search accepts literal input without filtering or losing the six static product cards
    it('NativeInteractionPart06_0010_native_search_input2_title1_price0', 0, async (): Promise<void> => {
      const driver = getDriver();
      const stable: boolean = await waitForMallStable(driver);
      expect(stable).assertTrue();
      const expectedTitle: string = resourceText(getProductTitle(1));
      const expectedPrice: string = resourceText(getProductPrice(0));
      const titleVisible: boolean = await checkTextContent(driver, expectedTitle);
      const priceVisible: boolean = await checkTextContent(driver, expectedPrice);
      expect(titleVisible).assertTrue();
      expect(priceVisible).assertTrue();
      await inputSearch(driver, 'phone 2026');
      const inputMatches: boolean = await waitForSearchText(driver, 'phone 2026');
      expect(inputMatches).assertTrue();
      await assertCatalogVisible(driver);
      await clearSearch(driver);
      const cleared: boolean = await waitForSearchText(driver, '');
      expect(cleared).assertTrue();
    });

    // @tc.number NativeInteractionPart06_0011_native_search_input3_title1_price0
    // @tc.name NativeInteractionPart06_0011_native_search_input3_title1_price0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc Native Search accepts literal input without filtering or losing the six static product cards
    it('NativeInteractionPart06_0011_native_search_input3_title1_price0', 0, async (): Promise<void> => {
      const driver = getDriver();
      const stable: boolean = await waitForMallStable(driver);
      expect(stable).assertTrue();
      const expectedTitle: string = resourceText(getProductTitle(1));
      const expectedPrice: string = resourceText(getProductPrice(0));
      const titleVisible: boolean = await checkTextContent(driver, expectedTitle);
      const priceVisible: boolean = await checkTextContent(driver, expectedPrice);
      expect(titleVisible).assertTrue();
      expect(priceVisible).assertTrue();
      await inputSearch(driver, 'a+b&c');
      const inputMatches: boolean = await waitForSearchText(driver, 'a+b&c');
      expect(inputMatches).assertTrue();
      await assertCatalogVisible(driver);
      await clearSearch(driver);
      const cleared: boolean = await waitForSearchText(driver, '');
      expect(cleared).assertTrue();
    });

    // @tc.number NativeInteractionPart06_0012_native_search_input4_title1_price0
    // @tc.name NativeInteractionPart06_0012_native_search_input4_title1_price0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc Native Search accepts literal input without filtering or losing the six static product cards
    it('NativeInteractionPart06_0012_native_search_input4_title1_price0', 0, async (): Promise<void> => {
      const driver = getDriver();
      const stable: boolean = await waitForMallStable(driver);
      expect(stable).assertTrue();
      const expectedTitle: string = resourceText(getProductTitle(1));
      const expectedPrice: string = resourceText(getProductPrice(0));
      const titleVisible: boolean = await checkTextContent(driver, expectedTitle);
      const priceVisible: boolean = await checkTextContent(driver, expectedPrice);
      expect(titleVisible).assertTrue();
      expect(priceVisible).assertTrue();
      await inputSearch(driver, '1234567890');
      const inputMatches: boolean = await waitForSearchText(driver, '1234567890');
      expect(inputMatches).assertTrue();
      await assertCatalogVisible(driver);
      await clearSearch(driver);
      const cleared: boolean = await waitForSearchText(driver, '');
      expect(cleared).assertTrue();
    });

    // @tc.number NativeInteractionPart06_0013_native_search_input5_title1_price0
    // @tc.name NativeInteractionPart06_0013_native_search_input5_title1_price0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc Native Search accepts literal input without filtering or losing the six static product cards
    it('NativeInteractionPart06_0013_native_search_input5_title1_price0', 0, async (): Promise<void> => {
      const driver = getDriver();
      const stable: boolean = await waitForMallStable(driver);
      expect(stable).assertTrue();
      const expectedTitle: string = resourceText(getProductTitle(1));
      const expectedPrice: string = resourceText(getProductPrice(0));
      const titleVisible: boolean = await checkTextContent(driver, expectedTitle);
      const priceVisible: boolean = await checkTextContent(driver, expectedPrice);
      expect(titleVisible).assertTrue();
      expect(priceVisible).assertTrue();
      await inputSearch(driver, 'search-item');
      const inputMatches: boolean = await waitForSearchText(driver, 'search-item');
      expect(inputMatches).assertTrue();
      await assertCatalogVisible(driver);
      await clearSearch(driver);
      const cleared: boolean = await waitForSearchText(driver, '');
      expect(cleared).assertTrue();
    });

    // [REMOVED_TIMEOUT] NativeInteractionPart06_0016_native_search_input6_title1_price0: see docs/runtime_removed_cases/timeout_cases.

    // @tc.number NativeInteractionPart06_0014_native_search_input7_title1_price0
    // @tc.name NativeInteractionPart06_0014_native_search_input7_title1_price0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc Native Search accepts literal input without filtering or losing the six static product cards
    it('NativeInteractionPart06_0014_native_search_input7_title1_price0', 0, async (): Promise<void> => {
      const driver = getDriver();
      const stable: boolean = await waitForMallStable(driver);
      expect(stable).assertTrue();
      const expectedTitle: string = resourceText(getProductTitle(1));
      const expectedPrice: string = resourceText(getProductPrice(0));
      const titleVisible: boolean = await checkTextContent(driver, expectedTitle);
      const priceVisible: boolean = await checkTextContent(driver, expectedPrice);
      expect(titleVisible).assertTrue();
      expect(priceVisible).assertTrue();
      await inputSearch(driver, '<script>test</script>');
      const inputMatches: boolean = await waitForSearchText(driver, '<script>test</script>');
      expect(inputMatches).assertTrue();
      await assertCatalogVisible(driver);
      await clearSearch(driver);
      const cleared: boolean = await waitForSearchText(driver, '');
      expect(cleared).assertTrue();
    });

    // @tc.number NativeInteractionPart06_0015_native_search_input0_title2_price0
    // @tc.name NativeInteractionPart06_0015_native_search_input0_title2_price0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc Native Search accepts literal input without filtering or losing the six static product cards
    it('NativeInteractionPart06_0015_native_search_input0_title2_price0', 0, async (): Promise<void> => {
      const driver = getDriver();
      const stable: boolean = await waitForMallStable(driver);
      expect(stable).assertTrue();
      const expectedTitle: string = resourceText(getProductTitle(2));
      const expectedPrice: string = resourceText(getProductPrice(0));
      const titleVisible: boolean = await checkTextContent(driver, expectedTitle);
      const priceVisible: boolean = await checkTextContent(driver, expectedPrice);
      expect(titleVisible).assertTrue();
      expect(priceVisible).assertTrue();
      await inputSearch(driver, '');
      const inputMatches: boolean = await waitForSearchText(driver, '');
      expect(inputMatches).assertTrue();
      await assertCatalogVisible(driver);
      await clearSearch(driver);
      const cleared: boolean = await waitForSearchText(driver, '');
      expect(cleared).assertTrue();
    });

    // @tc.number NativeInteractionPart06_0016_native_search_input1_title2_price0
    // @tc.name NativeInteractionPart06_0016_native_search_input1_title2_price0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc Native Search accepts literal input without filtering or losing the six static product cards
    it('NativeInteractionPart06_0016_native_search_input1_title2_price0', 0, async (): Promise<void> => {
      const driver = getDriver();
      const stable: boolean = await waitForMallStable(driver);
      expect(stable).assertTrue();
      const expectedTitle: string = resourceText(getProductTitle(2));
      const expectedPrice: string = resourceText(getProductPrice(0));
      const titleVisible: boolean = await checkTextContent(driver, expectedTitle);
      const priceVisible: boolean = await checkTextContent(driver, expectedPrice);
      expect(titleVisible).assertTrue();
      expect(priceVisible).assertTrue();
      await inputSearch(driver, 'ArkWeb');
      const inputMatches: boolean = await waitForSearchText(driver, 'ArkWeb');
      expect(inputMatches).assertTrue();
      await assertCatalogVisible(driver);
      await clearSearch(driver);
      const cleared: boolean = await waitForSearchText(driver, '');
      expect(cleared).assertTrue();
    });

    // @tc.number NativeInteractionPart06_0017_native_search_input2_title2_price0
    // @tc.name NativeInteractionPart06_0017_native_search_input2_title2_price0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc Native Search accepts literal input without filtering or losing the six static product cards
    it('NativeInteractionPart06_0017_native_search_input2_title2_price0', 0, async (): Promise<void> => {
      const driver = getDriver();
      const stable: boolean = await waitForMallStable(driver);
      expect(stable).assertTrue();
      const expectedTitle: string = resourceText(getProductTitle(2));
      const expectedPrice: string = resourceText(getProductPrice(0));
      const titleVisible: boolean = await checkTextContent(driver, expectedTitle);
      const priceVisible: boolean = await checkTextContent(driver, expectedPrice);
      expect(titleVisible).assertTrue();
      expect(priceVisible).assertTrue();
      await inputSearch(driver, 'phone 2026');
      const inputMatches: boolean = await waitForSearchText(driver, 'phone 2026');
      expect(inputMatches).assertTrue();
      await assertCatalogVisible(driver);
      await clearSearch(driver);
      const cleared: boolean = await waitForSearchText(driver, '');
      expect(cleared).assertTrue();
    });

    // @tc.number NativeInteractionPart06_0018_native_search_input3_title2_price0
    // @tc.name NativeInteractionPart06_0018_native_search_input3_title2_price0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc Native Search accepts literal input without filtering or losing the six static product cards
    it('NativeInteractionPart06_0018_native_search_input3_title2_price0', 0, async (): Promise<void> => {
      const driver = getDriver();
      const stable: boolean = await waitForMallStable(driver);
      expect(stable).assertTrue();
      const expectedTitle: string = resourceText(getProductTitle(2));
      const expectedPrice: string = resourceText(getProductPrice(0));
      const titleVisible: boolean = await checkTextContent(driver, expectedTitle);
      const priceVisible: boolean = await checkTextContent(driver, expectedPrice);
      expect(titleVisible).assertTrue();
      expect(priceVisible).assertTrue();
      await inputSearch(driver, 'a+b&c');
      const inputMatches: boolean = await waitForSearchText(driver, 'a+b&c');
      expect(inputMatches).assertTrue();
      await assertCatalogVisible(driver);
      await clearSearch(driver);
      const cleared: boolean = await waitForSearchText(driver, '');
      expect(cleared).assertTrue();
    });

    // @tc.number NativeInteractionPart06_0019_native_search_input4_title2_price0
    // @tc.name NativeInteractionPart06_0019_native_search_input4_title2_price0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc Native Search accepts literal input without filtering or losing the six static product cards
    it('NativeInteractionPart06_0019_native_search_input4_title2_price0', 0, async (): Promise<void> => {
      const driver = getDriver();
      const stable: boolean = await waitForMallStable(driver);
      expect(stable).assertTrue();
      const expectedTitle: string = resourceText(getProductTitle(2));
      const expectedPrice: string = resourceText(getProductPrice(0));
      const titleVisible: boolean = await checkTextContent(driver, expectedTitle);
      const priceVisible: boolean = await checkTextContent(driver, expectedPrice);
      expect(titleVisible).assertTrue();
      expect(priceVisible).assertTrue();
      await inputSearch(driver, '1234567890');
      const inputMatches: boolean = await waitForSearchText(driver, '1234567890');
      expect(inputMatches).assertTrue();
      await assertCatalogVisible(driver);
      await clearSearch(driver);
      const cleared: boolean = await waitForSearchText(driver, '');
      expect(cleared).assertTrue();
    });

    // @tc.number NativeInteractionPart06_0020_native_search_input5_title2_price0
    // @tc.name NativeInteractionPart06_0020_native_search_input5_title2_price0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc Native Search accepts literal input without filtering or losing the six static product cards
    it('NativeInteractionPart06_0020_native_search_input5_title2_price0', 0, async (): Promise<void> => {
      const driver = getDriver();
      const stable: boolean = await waitForMallStable(driver);
      expect(stable).assertTrue();
      const expectedTitle: string = resourceText(getProductTitle(2));
      const expectedPrice: string = resourceText(getProductPrice(0));
      const titleVisible: boolean = await checkTextContent(driver, expectedTitle);
      const priceVisible: boolean = await checkTextContent(driver, expectedPrice);
      expect(titleVisible).assertTrue();
      expect(priceVisible).assertTrue();
      await inputSearch(driver, 'search-item');
      const inputMatches: boolean = await waitForSearchText(driver, 'search-item');
      expect(inputMatches).assertTrue();
      await assertCatalogVisible(driver);
      await clearSearch(driver);
      const cleared: boolean = await waitForSearchText(driver, '');
      expect(cleared).assertTrue();
    });

    // [REMOVED_TIMEOUT] NativeInteractionPart06_0024_native_search_input6_title2_price0: see docs/runtime_removed_cases/timeout_cases.

    // @tc.number NativeInteractionPart06_0021_native_search_input7_title2_price0
    // @tc.name NativeInteractionPart06_0021_native_search_input7_title2_price0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc Native Search accepts literal input without filtering or losing the six static product cards
    it('NativeInteractionPart06_0021_native_search_input7_title2_price0', 0, async (): Promise<void> => {
      const driver = getDriver();
      const stable: boolean = await waitForMallStable(driver);
      expect(stable).assertTrue();
      const expectedTitle: string = resourceText(getProductTitle(2));
      const expectedPrice: string = resourceText(getProductPrice(0));
      const titleVisible: boolean = await checkTextContent(driver, expectedTitle);
      const priceVisible: boolean = await checkTextContent(driver, expectedPrice);
      expect(titleVisible).assertTrue();
      expect(priceVisible).assertTrue();
      await inputSearch(driver, '<script>test</script>');
      const inputMatches: boolean = await waitForSearchText(driver, '<script>test</script>');
      expect(inputMatches).assertTrue();
      await assertCatalogVisible(driver);
      await clearSearch(driver);
      const cleared: boolean = await waitForSearchText(driver, '');
      expect(cleared).assertTrue();
    });

    // @tc.number NativeInteractionPart06_0022_native_search_input0_title3_price0
    // @tc.name NativeInteractionPart06_0022_native_search_input0_title3_price0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc Native Search accepts literal input without filtering or losing the six static product cards
    it('NativeInteractionPart06_0022_native_search_input0_title3_price0', 0, async (): Promise<void> => {
      const driver = getDriver();
      const stable: boolean = await waitForMallStable(driver);
      expect(stable).assertTrue();
      const expectedTitle: string = resourceText(getProductTitle(3));
      const expectedPrice: string = resourceText(getProductPrice(0));
      const titleVisible: boolean = await checkTextContent(driver, expectedTitle);
      const priceVisible: boolean = await checkTextContent(driver, expectedPrice);
      expect(titleVisible).assertTrue();
      expect(priceVisible).assertTrue();
      await inputSearch(driver, '');
      const inputMatches: boolean = await waitForSearchText(driver, '');
      expect(inputMatches).assertTrue();
      await assertCatalogVisible(driver);
      await clearSearch(driver);
      const cleared: boolean = await waitForSearchText(driver, '');
      expect(cleared).assertTrue();
    });

    // @tc.number NativeInteractionPart06_0023_native_search_input1_title3_price0
    // @tc.name NativeInteractionPart06_0023_native_search_input1_title3_price0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc Native Search accepts literal input without filtering or losing the six static product cards
    it('NativeInteractionPart06_0023_native_search_input1_title3_price0', 0, async (): Promise<void> => {
      const driver = getDriver();
      const stable: boolean = await waitForMallStable(driver);
      expect(stable).assertTrue();
      const expectedTitle: string = resourceText(getProductTitle(3));
      const expectedPrice: string = resourceText(getProductPrice(0));
      const titleVisible: boolean = await checkTextContent(driver, expectedTitle);
      const priceVisible: boolean = await checkTextContent(driver, expectedPrice);
      expect(titleVisible).assertTrue();
      expect(priceVisible).assertTrue();
      await inputSearch(driver, 'ArkWeb');
      const inputMatches: boolean = await waitForSearchText(driver, 'ArkWeb');
      expect(inputMatches).assertTrue();
      await assertCatalogVisible(driver);
      await clearSearch(driver);
      const cleared: boolean = await waitForSearchText(driver, '');
      expect(cleared).assertTrue();
    });

    // @tc.number NativeInteractionPart06_0024_native_search_input2_title3_price0
    // @tc.name NativeInteractionPart06_0024_native_search_input2_title3_price0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc Native Search accepts literal input without filtering or losing the six static product cards
    it('NativeInteractionPart06_0024_native_search_input2_title3_price0', 0, async (): Promise<void> => {
      const driver = getDriver();
      const stable: boolean = await waitForMallStable(driver);
      expect(stable).assertTrue();
      const expectedTitle: string = resourceText(getProductTitle(3));
      const expectedPrice: string = resourceText(getProductPrice(0));
      const titleVisible: boolean = await checkTextContent(driver, expectedTitle);
      const priceVisible: boolean = await checkTextContent(driver, expectedPrice);
      expect(titleVisible).assertTrue();
      expect(priceVisible).assertTrue();
      await inputSearch(driver, 'phone 2026');
      const inputMatches: boolean = await waitForSearchText(driver, 'phone 2026');
      expect(inputMatches).assertTrue();
      await assertCatalogVisible(driver);
      await clearSearch(driver);
      const cleared: boolean = await waitForSearchText(driver, '');
      expect(cleared).assertTrue();
    });

    // @tc.number NativeInteractionPart06_0025_native_search_input3_title3_price0
    // @tc.name NativeInteractionPart06_0025_native_search_input3_title3_price0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc Native Search accepts literal input without filtering or losing the six static product cards
    it('NativeInteractionPart06_0025_native_search_input3_title3_price0', 0, async (): Promise<void> => {
      const driver = getDriver();
      const stable: boolean = await waitForMallStable(driver);
      expect(stable).assertTrue();
      const expectedTitle: string = resourceText(getProductTitle(3));
      const expectedPrice: string = resourceText(getProductPrice(0));
      const titleVisible: boolean = await checkTextContent(driver, expectedTitle);
      const priceVisible: boolean = await checkTextContent(driver, expectedPrice);
      expect(titleVisible).assertTrue();
      expect(priceVisible).assertTrue();
      await inputSearch(driver, 'a+b&c');
      const inputMatches: boolean = await waitForSearchText(driver, 'a+b&c');
      expect(inputMatches).assertTrue();
      await assertCatalogVisible(driver);
      await clearSearch(driver);
      const cleared: boolean = await waitForSearchText(driver, '');
      expect(cleared).assertTrue();
    });

    // @tc.number NativeInteractionPart06_0026_native_search_input4_title3_price0
    // @tc.name NativeInteractionPart06_0026_native_search_input4_title3_price0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc Native Search accepts literal input without filtering or losing the six static product cards
    it('NativeInteractionPart06_0026_native_search_input4_title3_price0', 0, async (): Promise<void> => {
      const driver = getDriver();
      const stable: boolean = await waitForMallStable(driver);
      expect(stable).assertTrue();
      const expectedTitle: string = resourceText(getProductTitle(3));
      const expectedPrice: string = resourceText(getProductPrice(0));
      const titleVisible: boolean = await checkTextContent(driver, expectedTitle);
      const priceVisible: boolean = await checkTextContent(driver, expectedPrice);
      expect(titleVisible).assertTrue();
      expect(priceVisible).assertTrue();
      await inputSearch(driver, '1234567890');
      const inputMatches: boolean = await waitForSearchText(driver, '1234567890');
      expect(inputMatches).assertTrue();
      await assertCatalogVisible(driver);
      await clearSearch(driver);
      const cleared: boolean = await waitForSearchText(driver, '');
      expect(cleared).assertTrue();
    });

    // @tc.number NativeInteractionPart06_0027_native_search_input5_title3_price0
    // @tc.name NativeInteractionPart06_0027_native_search_input5_title3_price0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc Native Search accepts literal input without filtering or losing the six static product cards
    it('NativeInteractionPart06_0027_native_search_input5_title3_price0', 0, async (): Promise<void> => {
      const driver = getDriver();
      const stable: boolean = await waitForMallStable(driver);
      expect(stable).assertTrue();
      const expectedTitle: string = resourceText(getProductTitle(3));
      const expectedPrice: string = resourceText(getProductPrice(0));
      const titleVisible: boolean = await checkTextContent(driver, expectedTitle);
      const priceVisible: boolean = await checkTextContent(driver, expectedPrice);
      expect(titleVisible).assertTrue();
      expect(priceVisible).assertTrue();
      await inputSearch(driver, 'search-item');
      const inputMatches: boolean = await waitForSearchText(driver, 'search-item');
      expect(inputMatches).assertTrue();
      await assertCatalogVisible(driver);
      await clearSearch(driver);
      const cleared: boolean = await waitForSearchText(driver, '');
      expect(cleared).assertTrue();
    });

    // [REMOVED_TIMEOUT] NativeInteractionPart06_0032_native_search_input6_title3_price0: see docs/runtime_removed_cases/timeout_cases.

    // @tc.number NativeInteractionPart06_0028_native_search_input7_title3_price0
    // @tc.name NativeInteractionPart06_0028_native_search_input7_title3_price0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc Native Search accepts literal input without filtering or losing the six static product cards
    it('NativeInteractionPart06_0028_native_search_input7_title3_price0', 0, async (): Promise<void> => {
      const driver = getDriver();
      const stable: boolean = await waitForMallStable(driver);
      expect(stable).assertTrue();
      const expectedTitle: string = resourceText(getProductTitle(3));
      const expectedPrice: string = resourceText(getProductPrice(0));
      const titleVisible: boolean = await checkTextContent(driver, expectedTitle);
      const priceVisible: boolean = await checkTextContent(driver, expectedPrice);
      expect(titleVisible).assertTrue();
      expect(priceVisible).assertTrue();
      await inputSearch(driver, '<script>test</script>');
      const inputMatches: boolean = await waitForSearchText(driver, '<script>test</script>');
      expect(inputMatches).assertTrue();
      await assertCatalogVisible(driver);
      await clearSearch(driver);
      const cleared: boolean = await waitForSearchText(driver, '');
      expect(cleared).assertTrue();
    });

    // [REMOVED] NativeInteractionPart06_0034_native_search_input0_title4_price0: see docs/runtime_removed_cases.
  });
}
