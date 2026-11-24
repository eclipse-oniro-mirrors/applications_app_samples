/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect } from '@ohos/hypium';
import { FeedDriver, runSerializedUiOperation } from './Shared/SharedDriver';
import { CommonConstants } from '../../../main/ets/common/CommonConstants';

export default function abilityTest(): void {
  describe('ShortVideoAbility', (): void => {
    it('entryAbilityRendersVideoFeed', 0, async (): Promise<void> => {
      await runSerializedUiOperation(async (): Promise<void> => {
        const feed = new FeedDriver();
        await feed.launch();
        const active = await feed.activeIndex(CommonConstants.VIDEO_SOURCE.length);
        expect(active >= 0).assertTrue();
      });
    });

    it('entryAbilityReturnsToFeedAfterHome', 0, async (): Promise<void> => {
      await runSerializedUiOperation(async (): Promise<void> => {
        const feed = new FeedDriver();
        await feed.launch();
        const before = await feed.activeIndex(CommonConstants.VIDEO_SOURCE.length);
        expect(before >= 0).assertTrue();
        await feed.sendHome();
        await feed.waitForFeedHidden();
        await feed.launch();
        await feed.waitForIndex(before);
        const after = await feed.activeIndex(CommonConstants.VIDEO_SOURCE.length);
        expect(after).assertEqual(before);
      });
    });

    // These launch checks do not require a working video server.
    // Streaming assertions are registered by VideoUi.test.ets.
  });
}
