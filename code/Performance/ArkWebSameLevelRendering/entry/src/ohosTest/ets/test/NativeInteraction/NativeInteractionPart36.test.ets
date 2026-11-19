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

export default function NativeInteractionPart36(): void {
  describe('NativeInteractionPart36', () => {
    beforeAll(async (): Promise<void> => {
      await yieldTestEventLoop();
    });
    beforeEach(async (): Promise<void> => {
      await yieldTestEventLoop();
    });
    afterEach((): void => {});
    afterAll((): void => {});

    // @tc.number NativeInteractionPart36_0001_background_foreground
    // @tc.name NativeInteractionPart36_0001_background_foreground
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc EntryAbility returns from Home with native Search and all product resources visible
    it('NativeInteractionPart36_0001_background_foreground', 0, async (): Promise<void> => {
      const driver = getDriver();
      const initiallyStable: boolean = await waitForMallStable(driver);
      expect(initiallyStable).assertTrue();
      await backgroundAndRestore(driver);
      const restored: boolean = await waitForMallStable(driver);
      expect(restored).assertTrue();
      await assertCatalogVisible(driver);
      await assertTwoColumnGrid(driver);
      await focusNativeSearch(driver);
      const focused: boolean = await checkFocusState(driver);
      expect(focused).assertTrue();
    });

    // [REMOVED] NativeInteractionPart36_0002_native_search_input1_title0_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart36_0003_native_search_input2_title0_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart36_0004_native_search_input3_title0_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart36_0005_native_search_input4_title0_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart36_0006_native_search_input5_title0_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart36_0007_native_search_input6_title0_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart36_0008_native_search_input7_title0_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart36_0009_native_search_input0_title1_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart36_0010_native_search_input1_title1_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart36_0011_native_search_input2_title1_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart36_0012_native_search_input3_title1_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart36_0013_native_search_input4_title1_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart36_0014_native_search_input5_title1_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart36_0015_native_search_input6_title1_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart36_0016_native_search_input7_title1_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart36_0017_native_search_input0_title2_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart36_0018_native_search_input1_title2_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart36_0019_native_search_input2_title2_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart36_0020_native_search_input3_title2_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart36_0021_native_search_input4_title2_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart36_0022_native_search_input5_title2_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart36_0023_native_search_input6_title2_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart36_0024_native_search_input7_title2_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart36_0025_native_search_input0_title3_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart36_0026_native_search_input1_title3_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart36_0027_native_search_input2_title3_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart36_0028_native_search_input3_title3_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart36_0029_native_search_input4_title3_price4: see docs/runtime_removed_cases.
  });
}
