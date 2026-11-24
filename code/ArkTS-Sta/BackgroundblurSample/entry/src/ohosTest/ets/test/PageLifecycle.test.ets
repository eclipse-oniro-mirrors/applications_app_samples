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
import { beforeEach, describe, expect, it } from '@ohos/hypium';
import { assertSelection, backgroundAndRestore, bounds, launchSample,
  positive, resetPage, sampleAbilityState, scrollToLastImage, selectTab, waitReady } from './SharedDriver';

export default function pageLifecycleTests(): void {
  describe('PageLifecycleTest', () => {
    beforeEach(async () => { await resetPage(); });

    it('PageLifecycleTest_actualEntryAbilityIsForeground', 0, async () => {
      expect(await sampleAbilityState()).assertEqual('FOREGROUND');
      expect(positive(await bounds('background-list'))).assertTrue();
    });

    it('PageLifecycleTest_foregroundRoundTripRetainsSelection', 0, async () => {
      await selectTab(3);
      await backgroundAndRestore();
      await assertSelection(3);
      await selectTab(1);
      await assertSelection(1);
    });

    it('PageLifecycleTest_foregroundRoundTripRetainsScrollOffset', 0, async () => {
      await scrollToLastImage();
      const before = await bounds('background-image-9');
      await backgroundAndRestore();
      const after = await bounds('background-image-9');
      expect(after.top).assertEqual(before.top);
      expect(after.bottom).assertEqual(before.bottom);
      expect(positive(await bounds('blur-tab-bar'))).assertTrue();
    });

    it('PageLifecycleTest_relaunchRequestKeepsUsableSingleTabBar', 0, async () => {
      await launchSample();
      await waitReady();
      await selectTab(2);
      await assertSelection(2);
      expect(positive(await bounds('background-list'))).assertTrue();
    });
  });
}
