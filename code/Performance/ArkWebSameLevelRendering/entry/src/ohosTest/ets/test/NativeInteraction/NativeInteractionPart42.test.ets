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

export default function NativeInteractionPart42(): void {
  describe('NativeInteractionPart42', () => {
    beforeAll(async (): Promise<void> => {
      await yieldTestEventLoop();
    });
    beforeEach(async (): Promise<void> => {
      await yieldTestEventLoop();
    });
    afterEach((): void => {});
    afterAll((): void => {});

    // @tc.number NativeInteractionPart42_0001_background_foreground
    // @tc.name NativeInteractionPart42_0001_background_foreground
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc EntryAbility returns from Home with native Search and all product resources visible
    it('NativeInteractionPart42_0001_background_foreground', 0, async (): Promise<void> => {
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

    // [REMOVED] NativeInteractionPart42_0002_native_search_input5_title3_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart42_0003_native_search_input6_title3_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart42_0004_native_search_input7_title3_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart42_0005_native_search_input0_title4_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart42_0006_native_search_input1_title4_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart42_0007_native_search_input2_title4_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart42_0008_native_search_input3_title4_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart42_0009_native_search_input4_title4_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart42_0010_native_search_input5_title4_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart42_0011_native_search_input6_title4_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart42_0012_native_search_input7_title4_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart42_0013_native_search_input0_title5_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart42_0014_native_search_input1_title5_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart42_0015_native_search_input2_title5_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart42_0016_native_search_input3_title5_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart42_0017_native_search_input4_title5_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart42_0018_native_search_input5_title5_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart42_0019_native_search_input6_title5_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart42_0020_native_search_input7_title5_price4: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart42_0021_native_search_input0_title0_price5: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart42_0022_native_search_input1_title0_price5: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart42_0023_native_search_input2_title0_price5: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart42_0024_native_search_input3_title0_price5: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart42_0025_native_search_input4_title0_price5: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart42_0026_native_search_input5_title0_price5: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart42_0027_native_search_input6_title0_price5: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart42_0028_native_search_input7_title0_price5: see docs/runtime_removed_cases.

    // [REMOVED] NativeInteractionPart42_0029_native_search_input0_title1_price5: see docs/runtime_removed_cases.
  });
}
