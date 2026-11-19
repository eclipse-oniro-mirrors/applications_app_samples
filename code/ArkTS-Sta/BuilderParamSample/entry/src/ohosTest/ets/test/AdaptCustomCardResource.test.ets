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

import { describe, it, expect } from '@ohos/hypium';
import { SlotScene, detailId, prepareSlotScene, assertSlotPresence, assertSlotTexts,
  assertSlotLayout, activateSlot } from './AdaptationMatrixDriver';
import { openHistory, slotCounts, ownerState } from './HistoryDriver';
import { bounds, click, exists, text, node, waitText, waitClearedText, assertPositiveRect,
  assertContained, assertWidthRatio, assertVerticalAlignment, assertRectClose, assertAbove,
  assertUniqueId, assertIdAbsent, waitForOriginalBounds, backgroundAndRestore } from './SharedDriver';

// Reference: ets/test/Validation/PointerUtilValidation.test.ets (1170 original lines).
// Explicit parameter cases are retained for independent DevEco selection and failure attribution.
export default function adaptCustomCardResourceTests(): void {
  describe('AdaptCustomCardResourceTest', (): void => {
    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDRESOURCE_0001
    // @tc.name AdaptCustomCardResource_0001
    // @tc.desc Verify props {"mode":"Resource","sibling":false,"clear":false,"resume":false,"first":"Label","restore":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardResource_0001', 0, async (): Promise<void> => {
      await openHistory('props');
      const passiveNode = await node('props-primary-label');
      await passiveNode.click();
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      const original = await bounds('props-primary-container');
      const siblingTitleBefore = await text('props-sibling-title');
      const siblingDescriptionBefore = await text('props-sibling-description');
      expect(siblingTitleBefore).assertEqual('Sibling title');
      expect(siblingDescriptionBefore).assertEqual('Sibling description');
      const resourceExpected = await text('props-resource-reference');
      expect(resourceExpected.length > 0).assertTrue();
      await click('props-resource');
      await waitText('props-primary-title', 'Primary title');
      await waitText('props-primary-description', resourceExpected);
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual(resourceExpected);
      const current = await bounds('props-primary-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-primary-row'), current);
      assertAbove(await bounds('props-primary-row'), await bounds('props-primary-divider'));
      await assertUniqueId('props-primary-label');
      await assertUniqueId('props-primary-symbol');
      await assertUniqueId('props-primary-title');
      await assertUniqueId('props-primary-description');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
    });

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDRESOURCE_0002
    // @tc.name AdaptCustomCardResource_0002
    // @tc.desc Verify props {"mode":"Resource","sibling":false,"clear":false,"resume":false,"first":"Label","restore":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardResource_0002', 0, async (): Promise<void> => {
      await openHistory('props');
      const passiveNode = await node('props-primary-label');
      await passiveNode.click();
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      const original = await bounds('props-primary-container');
      const siblingTitleBefore = await text('props-sibling-title');
      const siblingDescriptionBefore = await text('props-sibling-description');
      expect(siblingTitleBefore).assertEqual('Sibling title');
      expect(siblingDescriptionBefore).assertEqual('Sibling description');
      const resourceExpected = await text('props-resource-reference');
      expect(resourceExpected.length > 0).assertTrue();
      await click('props-resource');
      await waitText('props-primary-title', 'Primary title');
      await waitText('props-primary-description', resourceExpected);
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual(resourceExpected);
      const current = await bounds('props-primary-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-primary-row'), current);
      assertAbove(await bounds('props-primary-row'), await bounds('props-primary-divider'));
      await assertUniqueId('props-primary-label');
      await assertUniqueId('props-primary-symbol');
      await assertUniqueId('props-primary-title');
      await assertUniqueId('props-primary-description');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      await click('props-reset');
      await waitText('props-primary-title', 'Primary title');
      await waitText('props-primary-description', 'Primary description');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      assertRectClose(await bounds('props-primary-container'), original);
      await assertUniqueId('props-primary-label');
      await assertIdAbsent('props-renamed-container');
    });

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDRESOURCE_0003
    // @tc.name AdaptCustomCardResource_0003
    // @tc.desc Verify props {"mode":"Resource","sibling":false,"clear":false,"resume":false,"first":"Detail","restore":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardResource_0003', 0, async (): Promise<void> => {
      await openHistory('props');
      const passiveNode = await node('props-primary-detail');
      await passiveNode.click();
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      const original = await bounds('props-primary-container');
      const siblingTitleBefore = await text('props-sibling-title');
      const siblingDescriptionBefore = await text('props-sibling-description');
      expect(siblingTitleBefore).assertEqual('Sibling title');
      expect(siblingDescriptionBefore).assertEqual('Sibling description');
      const resourceExpected = await text('props-resource-reference');
      expect(resourceExpected.length > 0).assertTrue();
      await click('props-resource');
      await waitText('props-primary-title', 'Primary title');
      await waitText('props-primary-description', resourceExpected);
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual(resourceExpected);
      const current = await bounds('props-primary-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-primary-row'), current);
      assertAbove(await bounds('props-primary-row'), await bounds('props-primary-divider'));
      await assertUniqueId('props-primary-label');
      await assertUniqueId('props-primary-symbol');
      await assertUniqueId('props-primary-title');
      await assertUniqueId('props-primary-description');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
    });

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDRESOURCE_0004
    // @tc.name AdaptCustomCardResource_0004
    // @tc.desc Verify props {"mode":"Resource","sibling":false,"clear":false,"resume":false,"first":"Detail","restore":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardResource_0004', 0, async (): Promise<void> => {
      await openHistory('props');
      const passiveNode = await node('props-primary-detail');
      await passiveNode.click();
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      const original = await bounds('props-primary-container');
      const siblingTitleBefore = await text('props-sibling-title');
      const siblingDescriptionBefore = await text('props-sibling-description');
      expect(siblingTitleBefore).assertEqual('Sibling title');
      expect(siblingDescriptionBefore).assertEqual('Sibling description');
      const resourceExpected = await text('props-resource-reference');
      expect(resourceExpected.length > 0).assertTrue();
      await click('props-resource');
      await waitText('props-primary-title', 'Primary title');
      await waitText('props-primary-description', resourceExpected);
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual(resourceExpected);
      const current = await bounds('props-primary-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-primary-row'), current);
      assertAbove(await bounds('props-primary-row'), await bounds('props-primary-divider'));
      await assertUniqueId('props-primary-label');
      await assertUniqueId('props-primary-symbol');
      await assertUniqueId('props-primary-title');
      await assertUniqueId('props-primary-description');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      await click('props-reset');
      await waitText('props-primary-title', 'Primary title');
      await waitText('props-primary-description', 'Primary description');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      assertRectClose(await bounds('props-primary-container'), original);
      await assertUniqueId('props-primary-label');
      await assertIdAbsent('props-renamed-container');
    });

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDRESOURCE_0005
    // @tc.name AdaptCustomCardResource_0005
    // @tc.desc Verify props {"mode":"Resource","sibling":false,"clear":false,"resume":false,"first":"Divider","restore":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardResource_0005', 0, async (): Promise<void> => {
      await openHistory('props');
      const passiveNode = await node('props-primary-divider');
      await passiveNode.click();
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      const original = await bounds('props-primary-container');
      const siblingTitleBefore = await text('props-sibling-title');
      const siblingDescriptionBefore = await text('props-sibling-description');
      expect(siblingTitleBefore).assertEqual('Sibling title');
      expect(siblingDescriptionBefore).assertEqual('Sibling description');
      const resourceExpected = await text('props-resource-reference');
      expect(resourceExpected.length > 0).assertTrue();
      await click('props-resource');
      await waitText('props-primary-title', 'Primary title');
      await waitText('props-primary-description', resourceExpected);
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual(resourceExpected);
      const current = await bounds('props-primary-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-primary-row'), current);
      assertAbove(await bounds('props-primary-row'), await bounds('props-primary-divider'));
      await assertUniqueId('props-primary-label');
      await assertUniqueId('props-primary-symbol');
      await assertUniqueId('props-primary-title');
      await assertUniqueId('props-primary-description');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
    });

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDRESOURCE_0006
    // @tc.name AdaptCustomCardResource_0006
    // @tc.desc Verify props {"mode":"Resource","sibling":false,"clear":false,"resume":false,"first":"Divider","restore":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardResource_0006', 0, async (): Promise<void> => {
      await openHistory('props');
      const passiveNode = await node('props-primary-divider');
      await passiveNode.click();
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      const original = await bounds('props-primary-container');
      const siblingTitleBefore = await text('props-sibling-title');
      const siblingDescriptionBefore = await text('props-sibling-description');
      expect(siblingTitleBefore).assertEqual('Sibling title');
      expect(siblingDescriptionBefore).assertEqual('Sibling description');
      const resourceExpected = await text('props-resource-reference');
      expect(resourceExpected.length > 0).assertTrue();
      await click('props-resource');
      await waitText('props-primary-title', 'Primary title');
      await waitText('props-primary-description', resourceExpected);
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual(resourceExpected);
      const current = await bounds('props-primary-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-primary-row'), current);
      assertAbove(await bounds('props-primary-row'), await bounds('props-primary-divider'));
      await assertUniqueId('props-primary-label');
      await assertUniqueId('props-primary-symbol');
      await assertUniqueId('props-primary-title');
      await assertUniqueId('props-primary-description');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      await click('props-reset');
      await waitText('props-primary-title', 'Primary title');
      await waitText('props-primary-description', 'Primary description');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      assertRectClose(await bounds('props-primary-container'), original);
      await assertUniqueId('props-primary-label');
      await assertIdAbsent('props-renamed-container');
    });

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDRESOURCE_0007
    // @tc.name AdaptCustomCardResource_0007
    // @tc.desc Verify props {"mode":"Resource","sibling":false,"clear":false,"resume":false,"first":"Symbol","restore":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardResource_0007', 0, async (): Promise<void> => {
      await openHistory('props');
      const passiveNode = await node('props-primary-symbol');
      await passiveNode.click();
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      const original = await bounds('props-primary-container');
      const siblingTitleBefore = await text('props-sibling-title');
      const siblingDescriptionBefore = await text('props-sibling-description');
      expect(siblingTitleBefore).assertEqual('Sibling title');
      expect(siblingDescriptionBefore).assertEqual('Sibling description');
      const resourceExpected = await text('props-resource-reference');
      expect(resourceExpected.length > 0).assertTrue();
      await click('props-resource');
      await waitText('props-primary-title', 'Primary title');
      await waitText('props-primary-description', resourceExpected);
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual(resourceExpected);
      const current = await bounds('props-primary-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-primary-row'), current);
      assertAbove(await bounds('props-primary-row'), await bounds('props-primary-divider'));
      await assertUniqueId('props-primary-label');
      await assertUniqueId('props-primary-symbol');
      await assertUniqueId('props-primary-title');
      await assertUniqueId('props-primary-description');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
    });

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDRESOURCE_0008
    // @tc.name AdaptCustomCardResource_0008
    // @tc.desc Verify props {"mode":"Resource","sibling":false,"clear":false,"resume":false,"first":"Symbol","restore":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardResource_0008', 0, async (): Promise<void> => {
      await openHistory('props');
      const passiveNode = await node('props-primary-symbol');
      await passiveNode.click();
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      const original = await bounds('props-primary-container');
      const siblingTitleBefore = await text('props-sibling-title');
      const siblingDescriptionBefore = await text('props-sibling-description');
      expect(siblingTitleBefore).assertEqual('Sibling title');
      expect(siblingDescriptionBefore).assertEqual('Sibling description');
      const resourceExpected = await text('props-resource-reference');
      expect(resourceExpected.length > 0).assertTrue();
      await click('props-resource');
      await waitText('props-primary-title', 'Primary title');
      await waitText('props-primary-description', resourceExpected);
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual(resourceExpected);
      const current = await bounds('props-primary-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-primary-row'), current);
      assertAbove(await bounds('props-primary-row'), await bounds('props-primary-divider'));
      await assertUniqueId('props-primary-label');
      await assertUniqueId('props-primary-symbol');
      await assertUniqueId('props-primary-title');
      await assertUniqueId('props-primary-description');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      await click('props-reset');
      await waitText('props-primary-title', 'Primary title');
      await waitText('props-primary-description', 'Primary description');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      assertRectClose(await bounds('props-primary-container'), original);
      await assertUniqueId('props-primary-label');
      await assertIdAbsent('props-renamed-container');
    });

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDRESOURCE_0009
    // @tc.name AdaptCustomCardResource_0009
    // @tc.desc Verify props {"mode":"Resource","sibling":false,"clear":false,"resume":true,"first":"Label","restore":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardResource_0009', 0, async (): Promise<void> => {
      await openHistory('props');
      const passiveNode = await node('props-primary-label');
      await passiveNode.click();
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      const original = await bounds('props-primary-container');
      const siblingTitleBefore = await text('props-sibling-title');
      const siblingDescriptionBefore = await text('props-sibling-description');
      expect(siblingTitleBefore).assertEqual('Sibling title');
      expect(siblingDescriptionBefore).assertEqual('Sibling description');
      const resourceExpected = await text('props-resource-reference');
      expect(resourceExpected.length > 0).assertTrue();
      await click('props-resource');
      await waitText('props-primary-title', 'Primary title');
      await waitText('props-primary-description', resourceExpected);
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      await backgroundAndRestore('FixtureAbility', 'props-primary-title', 'Primary title');
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual(resourceExpected);
      const current = await bounds('props-primary-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-primary-row'), current);
      assertAbove(await bounds('props-primary-row'), await bounds('props-primary-divider'));
      await assertUniqueId('props-primary-label');
      await assertUniqueId('props-primary-symbol');
      await assertUniqueId('props-primary-title');
      await assertUniqueId('props-primary-description');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
    });

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDRESOURCE_0010
    // @tc.name AdaptCustomCardResource_0010
    // @tc.desc Verify props {"mode":"Resource","sibling":false,"clear":false,"resume":true,"first":"Label","restore":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardResource_0010', 0, async (): Promise<void> => {
      await openHistory('props');
      const passiveNode = await node('props-primary-label');
      await passiveNode.click();
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      const original = await bounds('props-primary-container');
      const siblingTitleBefore = await text('props-sibling-title');
      const siblingDescriptionBefore = await text('props-sibling-description');
      expect(siblingTitleBefore).assertEqual('Sibling title');
      expect(siblingDescriptionBefore).assertEqual('Sibling description');
      const resourceExpected = await text('props-resource-reference');
      expect(resourceExpected.length > 0).assertTrue();
      await click('props-resource');
      await waitText('props-primary-title', 'Primary title');
      await waitText('props-primary-description', resourceExpected);
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      await backgroundAndRestore('FixtureAbility', 'props-primary-title', 'Primary title');
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual(resourceExpected);
      const current = await bounds('props-primary-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-primary-row'), current);
      assertAbove(await bounds('props-primary-row'), await bounds('props-primary-divider'));
      await assertUniqueId('props-primary-label');
      await assertUniqueId('props-primary-symbol');
      await assertUniqueId('props-primary-title');
      await assertUniqueId('props-primary-description');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      await click('props-reset');
      await waitText('props-primary-title', 'Primary title');
      await waitText('props-primary-description', 'Primary description');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      assertRectClose(await bounds('props-primary-container'), original);
      await assertUniqueId('props-primary-label');
      await assertIdAbsent('props-renamed-container');
    });

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDRESOURCE_0011
    // @tc.name AdaptCustomCardResource_0011
    // @tc.desc Verify props {"mode":"Resource","sibling":false,"clear":false,"resume":true,"first":"Detail","restore":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardResource_0011', 0, async (): Promise<void> => {
      await openHistory('props');
      const passiveNode = await node('props-primary-detail');
      await passiveNode.click();
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      const original = await bounds('props-primary-container');
      const siblingTitleBefore = await text('props-sibling-title');
      const siblingDescriptionBefore = await text('props-sibling-description');
      expect(siblingTitleBefore).assertEqual('Sibling title');
      expect(siblingDescriptionBefore).assertEqual('Sibling description');
      const resourceExpected = await text('props-resource-reference');
      expect(resourceExpected.length > 0).assertTrue();
      await click('props-resource');
      await waitText('props-primary-title', 'Primary title');
      await waitText('props-primary-description', resourceExpected);
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      await backgroundAndRestore('FixtureAbility', 'props-primary-title', 'Primary title');
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual(resourceExpected);
      const current = await bounds('props-primary-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-primary-row'), current);
      assertAbove(await bounds('props-primary-row'), await bounds('props-primary-divider'));
      await assertUniqueId('props-primary-label');
      await assertUniqueId('props-primary-symbol');
      await assertUniqueId('props-primary-title');
      await assertUniqueId('props-primary-description');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
    });

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDRESOURCE_0012
    // @tc.name AdaptCustomCardResource_0012
    // @tc.desc Verify props {"mode":"Resource","sibling":false,"clear":false,"resume":true,"first":"Detail","restore":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardResource_0012', 0, async (): Promise<void> => {
      await openHistory('props');
      const passiveNode = await node('props-primary-detail');
      await passiveNode.click();
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      const original = await bounds('props-primary-container');
      const siblingTitleBefore = await text('props-sibling-title');
      const siblingDescriptionBefore = await text('props-sibling-description');
      expect(siblingTitleBefore).assertEqual('Sibling title');
      expect(siblingDescriptionBefore).assertEqual('Sibling description');
      const resourceExpected = await text('props-resource-reference');
      expect(resourceExpected.length > 0).assertTrue();
      await click('props-resource');
      await waitText('props-primary-title', 'Primary title');
      await waitText('props-primary-description', resourceExpected);
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      await backgroundAndRestore('FixtureAbility', 'props-primary-title', 'Primary title');
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual(resourceExpected);
      const current = await bounds('props-primary-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-primary-row'), current);
      assertAbove(await bounds('props-primary-row'), await bounds('props-primary-divider'));
      await assertUniqueId('props-primary-label');
      await assertUniqueId('props-primary-symbol');
      await assertUniqueId('props-primary-title');
      await assertUniqueId('props-primary-description');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      await click('props-reset');
      await waitText('props-primary-title', 'Primary title');
      await waitText('props-primary-description', 'Primary description');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      assertRectClose(await bounds('props-primary-container'), original);
      await assertUniqueId('props-primary-label');
      await assertIdAbsent('props-renamed-container');
    });

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDRESOURCE_0013
    // @tc.name AdaptCustomCardResource_0013
    // @tc.desc Verify props {"mode":"Resource","sibling":false,"clear":false,"resume":true,"first":"Divider","restore":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardResource_0013', 0, async (): Promise<void> => {
      await openHistory('props');
      const passiveNode = await node('props-primary-divider');
      await passiveNode.click();
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      const original = await bounds('props-primary-container');
      const siblingTitleBefore = await text('props-sibling-title');
      const siblingDescriptionBefore = await text('props-sibling-description');
      expect(siblingTitleBefore).assertEqual('Sibling title');
      expect(siblingDescriptionBefore).assertEqual('Sibling description');
      const resourceExpected = await text('props-resource-reference');
      expect(resourceExpected.length > 0).assertTrue();
      await click('props-resource');
      await waitText('props-primary-title', 'Primary title');
      await waitText('props-primary-description', resourceExpected);
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      await backgroundAndRestore('FixtureAbility', 'props-primary-title', 'Primary title');
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual(resourceExpected);
      const current = await bounds('props-primary-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-primary-row'), current);
      assertAbove(await bounds('props-primary-row'), await bounds('props-primary-divider'));
      await assertUniqueId('props-primary-label');
      await assertUniqueId('props-primary-symbol');
      await assertUniqueId('props-primary-title');
      await assertUniqueId('props-primary-description');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
    });

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDRESOURCE_0014
    // @tc.name AdaptCustomCardResource_0014
    // @tc.desc Verify props {"mode":"Resource","sibling":false,"clear":false,"resume":true,"first":"Divider","restore":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardResource_0014', 0, async (): Promise<void> => {
      await openHistory('props');
      const passiveNode = await node('props-primary-divider');
      await passiveNode.click();
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      const original = await bounds('props-primary-container');
      const siblingTitleBefore = await text('props-sibling-title');
      const siblingDescriptionBefore = await text('props-sibling-description');
      expect(siblingTitleBefore).assertEqual('Sibling title');
      expect(siblingDescriptionBefore).assertEqual('Sibling description');
      const resourceExpected = await text('props-resource-reference');
      expect(resourceExpected.length > 0).assertTrue();
      await click('props-resource');
      await waitText('props-primary-title', 'Primary title');
      await waitText('props-primary-description', resourceExpected);
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      await backgroundAndRestore('FixtureAbility', 'props-primary-title', 'Primary title');
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual(resourceExpected);
      const current = await bounds('props-primary-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-primary-row'), current);
      assertAbove(await bounds('props-primary-row'), await bounds('props-primary-divider'));
      await assertUniqueId('props-primary-label');
      await assertUniqueId('props-primary-symbol');
      await assertUniqueId('props-primary-title');
      await assertUniqueId('props-primary-description');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      await click('props-reset');
      await waitText('props-primary-title', 'Primary title');
      await waitText('props-primary-description', 'Primary description');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      assertRectClose(await bounds('props-primary-container'), original);
      await assertUniqueId('props-primary-label');
      await assertIdAbsent('props-renamed-container');
    });

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDRESOURCE_0015
    // @tc.name AdaptCustomCardResource_0015
    // @tc.desc Verify props {"mode":"Resource","sibling":false,"clear":false,"resume":true,"first":"Symbol","restore":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardResource_0015', 0, async (): Promise<void> => {
      await openHistory('props');
      const passiveNode = await node('props-primary-symbol');
      await passiveNode.click();
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      const original = await bounds('props-primary-container');
      const siblingTitleBefore = await text('props-sibling-title');
      const siblingDescriptionBefore = await text('props-sibling-description');
      expect(siblingTitleBefore).assertEqual('Sibling title');
      expect(siblingDescriptionBefore).assertEqual('Sibling description');
      const resourceExpected = await text('props-resource-reference');
      expect(resourceExpected.length > 0).assertTrue();
      await click('props-resource');
      await waitText('props-primary-title', 'Primary title');
      await waitText('props-primary-description', resourceExpected);
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      await backgroundAndRestore('FixtureAbility', 'props-primary-title', 'Primary title');
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual(resourceExpected);
      const current = await bounds('props-primary-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-primary-row'), current);
      assertAbove(await bounds('props-primary-row'), await bounds('props-primary-divider'));
      await assertUniqueId('props-primary-label');
      await assertUniqueId('props-primary-symbol');
      await assertUniqueId('props-primary-title');
      await assertUniqueId('props-primary-description');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
    });

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDRESOURCE_0016
    // @tc.name AdaptCustomCardResource_0016
    // @tc.desc Verify props {"mode":"Resource","sibling":false,"clear":false,"resume":true,"first":"Symbol","restore":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardResource_0016', 0, async (): Promise<void> => {
      await openHistory('props');
      const passiveNode = await node('props-primary-symbol');
      await passiveNode.click();
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      const original = await bounds('props-primary-container');
      const siblingTitleBefore = await text('props-sibling-title');
      const siblingDescriptionBefore = await text('props-sibling-description');
      expect(siblingTitleBefore).assertEqual('Sibling title');
      expect(siblingDescriptionBefore).assertEqual('Sibling description');
      const resourceExpected = await text('props-resource-reference');
      expect(resourceExpected.length > 0).assertTrue();
      await click('props-resource');
      await waitText('props-primary-title', 'Primary title');
      await waitText('props-primary-description', resourceExpected);
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      await backgroundAndRestore('FixtureAbility', 'props-primary-title', 'Primary title');
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual(resourceExpected);
      const current = await bounds('props-primary-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-primary-row'), current);
      assertAbove(await bounds('props-primary-row'), await bounds('props-primary-divider'));
      await assertUniqueId('props-primary-label');
      await assertUniqueId('props-primary-symbol');
      await assertUniqueId('props-primary-title');
      await assertUniqueId('props-primary-description');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      await click('props-reset');
      await waitText('props-primary-title', 'Primary title');
      await waitText('props-primary-description', 'Primary description');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      assertRectClose(await bounds('props-primary-container'), original);
      await assertUniqueId('props-primary-label');
      await assertIdAbsent('props-renamed-container');
    });

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDRESOURCE_0017
    // @tc.name AdaptCustomCardResource_0017
    // @tc.desc Verify props {"mode":"Resource","sibling":false,"clear":true,"resume":false,"first":"Label","restore":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardResource_0017', 0, async (): Promise<void> => {
      await openHistory('props');
      const passiveNode = await node('props-primary-label');
      await passiveNode.click();
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      const original = await bounds('props-primary-container');
      const siblingTitleBefore = await text('props-sibling-title');
      const siblingDescriptionBefore = await text('props-sibling-description');
      expect(siblingTitleBefore).assertEqual('Sibling title');
      expect(siblingDescriptionBefore).assertEqual('Sibling description');
      await click('props-clear-title');
      await waitClearedText('props-primary-title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      await click('props-clear-description');
      await waitClearedText('props-primary-description');
      await assertUniqueId('props-primary-container');
      await assertUniqueId('props-primary-label');
      await click('props-title');
      await waitText('props-primary-title', 'Changed title');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      const resourceExpected = await text('props-resource-reference');
      expect(resourceExpected.length > 0).assertTrue();
      await click('props-resource');
      await waitText('props-primary-title', 'Changed title');
      await waitText('props-primary-description', resourceExpected);
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      expect(await text('props-primary-title')).assertEqual('Changed title');
      expect(await text('props-primary-description')).assertEqual(resourceExpected);
      const current = await bounds('props-primary-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-primary-row'), current);
      assertAbove(await bounds('props-primary-row'), await bounds('props-primary-divider'));
      await assertUniqueId('props-primary-label');
      await assertUniqueId('props-primary-symbol');
      await assertUniqueId('props-primary-title');
      await assertUniqueId('props-primary-description');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      expect(await text('props-primary-title')).assertEqual('Changed title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
    });

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDRESOURCE_0018
    // @tc.name AdaptCustomCardResource_0018
    // @tc.desc Verify props {"mode":"Resource","sibling":false,"clear":true,"resume":false,"first":"Label","restore":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardResource_0018', 0, async (): Promise<void> => {
      await openHistory('props');
      const passiveNode = await node('props-primary-label');
      await passiveNode.click();
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      const original = await bounds('props-primary-container');
      const siblingTitleBefore = await text('props-sibling-title');
      const siblingDescriptionBefore = await text('props-sibling-description');
      expect(siblingTitleBefore).assertEqual('Sibling title');
      expect(siblingDescriptionBefore).assertEqual('Sibling description');
      await click('props-clear-title');
      await waitClearedText('props-primary-title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      await click('props-clear-description');
      await waitClearedText('props-primary-description');
      await assertUniqueId('props-primary-container');
      await assertUniqueId('props-primary-label');
      await click('props-title');
      await waitText('props-primary-title', 'Changed title');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      const resourceExpected = await text('props-resource-reference');
      expect(resourceExpected.length > 0).assertTrue();
      await click('props-resource');
      await waitText('props-primary-title', 'Changed title');
      await waitText('props-primary-description', resourceExpected);
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      expect(await text('props-primary-title')).assertEqual('Changed title');
      expect(await text('props-primary-description')).assertEqual(resourceExpected);
      const current = await bounds('props-primary-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-primary-row'), current);
      assertAbove(await bounds('props-primary-row'), await bounds('props-primary-divider'));
      await assertUniqueId('props-primary-label');
      await assertUniqueId('props-primary-symbol');
      await assertUniqueId('props-primary-title');
      await assertUniqueId('props-primary-description');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      expect(await text('props-primary-title')).assertEqual('Changed title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      await click('props-reset');
      await waitText('props-primary-title', 'Primary title');
      await waitText('props-primary-description', 'Primary description');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      assertRectClose(await bounds('props-primary-container'), original);
      await assertUniqueId('props-primary-label');
      await assertIdAbsent('props-renamed-container');
    });

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDRESOURCE_0019
    // @tc.name AdaptCustomCardResource_0019
    // @tc.desc Verify props {"mode":"Resource","sibling":false,"clear":true,"resume":false,"first":"Detail","restore":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardResource_0019', 0, async (): Promise<void> => {
      await openHistory('props');
      const passiveNode = await node('props-primary-detail');
      await passiveNode.click();
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      const original = await bounds('props-primary-container');
      const siblingTitleBefore = await text('props-sibling-title');
      const siblingDescriptionBefore = await text('props-sibling-description');
      expect(siblingTitleBefore).assertEqual('Sibling title');
      expect(siblingDescriptionBefore).assertEqual('Sibling description');
      await click('props-clear-title');
      await waitClearedText('props-primary-title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      await click('props-clear-description');
      await waitClearedText('props-primary-description');
      await assertUniqueId('props-primary-container');
      await assertUniqueId('props-primary-label');
      await click('props-title');
      await waitText('props-primary-title', 'Changed title');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      const resourceExpected = await text('props-resource-reference');
      expect(resourceExpected.length > 0).assertTrue();
      await click('props-resource');
      await waitText('props-primary-title', 'Changed title');
      await waitText('props-primary-description', resourceExpected);
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      expect(await text('props-primary-title')).assertEqual('Changed title');
      expect(await text('props-primary-description')).assertEqual(resourceExpected);
      const current = await bounds('props-primary-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-primary-row'), current);
      assertAbove(await bounds('props-primary-row'), await bounds('props-primary-divider'));
      await assertUniqueId('props-primary-label');
      await assertUniqueId('props-primary-symbol');
      await assertUniqueId('props-primary-title');
      await assertUniqueId('props-primary-description');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      expect(await text('props-primary-title')).assertEqual('Changed title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
    });

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDRESOURCE_0020
    // @tc.name AdaptCustomCardResource_0020
    // @tc.desc Verify props {"mode":"Resource","sibling":false,"clear":true,"resume":false,"first":"Detail","restore":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardResource_0020', 0, async (): Promise<void> => {
      await openHistory('props');
      const passiveNode = await node('props-primary-detail');
      await passiveNode.click();
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      const original = await bounds('props-primary-container');
      const siblingTitleBefore = await text('props-sibling-title');
      const siblingDescriptionBefore = await text('props-sibling-description');
      expect(siblingTitleBefore).assertEqual('Sibling title');
      expect(siblingDescriptionBefore).assertEqual('Sibling description');
      await click('props-clear-title');
      await waitClearedText('props-primary-title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      await click('props-clear-description');
      await waitClearedText('props-primary-description');
      await assertUniqueId('props-primary-container');
      await assertUniqueId('props-primary-label');
      await click('props-title');
      await waitText('props-primary-title', 'Changed title');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      const resourceExpected = await text('props-resource-reference');
      expect(resourceExpected.length > 0).assertTrue();
      await click('props-resource');
      await waitText('props-primary-title', 'Changed title');
      await waitText('props-primary-description', resourceExpected);
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      expect(await text('props-primary-title')).assertEqual('Changed title');
      expect(await text('props-primary-description')).assertEqual(resourceExpected);
      const current = await bounds('props-primary-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-primary-row'), current);
      assertAbove(await bounds('props-primary-row'), await bounds('props-primary-divider'));
      await assertUniqueId('props-primary-label');
      await assertUniqueId('props-primary-symbol');
      await assertUniqueId('props-primary-title');
      await assertUniqueId('props-primary-description');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      expect(await text('props-primary-title')).assertEqual('Changed title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      await click('props-reset');
      await waitText('props-primary-title', 'Primary title');
      await waitText('props-primary-description', 'Primary description');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      assertRectClose(await bounds('props-primary-container'), original);
      await assertUniqueId('props-primary-label');
      await assertIdAbsent('props-renamed-container');
    });

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDRESOURCE_0021
    // @tc.name AdaptCustomCardResource_0021
    // @tc.desc Verify props {"mode":"Resource","sibling":false,"clear":true,"resume":false,"first":"Divider","restore":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardResource_0021', 0, async (): Promise<void> => {
      await openHistory('props');
      const passiveNode = await node('props-primary-divider');
      await passiveNode.click();
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      const original = await bounds('props-primary-container');
      const siblingTitleBefore = await text('props-sibling-title');
      const siblingDescriptionBefore = await text('props-sibling-description');
      expect(siblingTitleBefore).assertEqual('Sibling title');
      expect(siblingDescriptionBefore).assertEqual('Sibling description');
      await click('props-clear-title');
      await waitClearedText('props-primary-title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      await click('props-clear-description');
      await waitClearedText('props-primary-description');
      await assertUniqueId('props-primary-container');
      await assertUniqueId('props-primary-label');
      await click('props-title');
      await waitText('props-primary-title', 'Changed title');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      const resourceExpected = await text('props-resource-reference');
      expect(resourceExpected.length > 0).assertTrue();
      await click('props-resource');
      await waitText('props-primary-title', 'Changed title');
      await waitText('props-primary-description', resourceExpected);
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      expect(await text('props-primary-title')).assertEqual('Changed title');
      expect(await text('props-primary-description')).assertEqual(resourceExpected);
      const current = await bounds('props-primary-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-primary-row'), current);
      assertAbove(await bounds('props-primary-row'), await bounds('props-primary-divider'));
      await assertUniqueId('props-primary-label');
      await assertUniqueId('props-primary-symbol');
      await assertUniqueId('props-primary-title');
      await assertUniqueId('props-primary-description');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      expect(await text('props-primary-title')).assertEqual('Changed title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
    });

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDRESOURCE_0022
    // @tc.name AdaptCustomCardResource_0022
    // @tc.desc Verify props {"mode":"Resource","sibling":false,"clear":true,"resume":false,"first":"Divider","restore":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardResource_0022', 0, async (): Promise<void> => {
      await openHistory('props');
      const passiveNode = await node('props-primary-divider');
      await passiveNode.click();
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      const original = await bounds('props-primary-container');
      const siblingTitleBefore = await text('props-sibling-title');
      const siblingDescriptionBefore = await text('props-sibling-description');
      expect(siblingTitleBefore).assertEqual('Sibling title');
      expect(siblingDescriptionBefore).assertEqual('Sibling description');
      await click('props-clear-title');
      await waitClearedText('props-primary-title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      await click('props-clear-description');
      await waitClearedText('props-primary-description');
      await assertUniqueId('props-primary-container');
      await assertUniqueId('props-primary-label');
      await click('props-title');
      await waitText('props-primary-title', 'Changed title');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      const resourceExpected = await text('props-resource-reference');
      expect(resourceExpected.length > 0).assertTrue();
      await click('props-resource');
      await waitText('props-primary-title', 'Changed title');
      await waitText('props-primary-description', resourceExpected);
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      expect(await text('props-primary-title')).assertEqual('Changed title');
      expect(await text('props-primary-description')).assertEqual(resourceExpected);
      const current = await bounds('props-primary-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-primary-row'), current);
      assertAbove(await bounds('props-primary-row'), await bounds('props-primary-divider'));
      await assertUniqueId('props-primary-label');
      await assertUniqueId('props-primary-symbol');
      await assertUniqueId('props-primary-title');
      await assertUniqueId('props-primary-description');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      expect(await text('props-primary-title')).assertEqual('Changed title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      await click('props-reset');
      await waitText('props-primary-title', 'Primary title');
      await waitText('props-primary-description', 'Primary description');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      assertRectClose(await bounds('props-primary-container'), original);
      await assertUniqueId('props-primary-label');
      await assertIdAbsent('props-renamed-container');
    });

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDRESOURCE_0023
    // @tc.name AdaptCustomCardResource_0023
    // @tc.desc Verify props {"mode":"Resource","sibling":false,"clear":true,"resume":false,"first":"Symbol","restore":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardResource_0023', 0, async (): Promise<void> => {
      await openHistory('props');
      const passiveNode = await node('props-primary-symbol');
      await passiveNode.click();
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      const original = await bounds('props-primary-container');
      const siblingTitleBefore = await text('props-sibling-title');
      const siblingDescriptionBefore = await text('props-sibling-description');
      expect(siblingTitleBefore).assertEqual('Sibling title');
      expect(siblingDescriptionBefore).assertEqual('Sibling description');
      await click('props-clear-title');
      await waitClearedText('props-primary-title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      await click('props-clear-description');
      await waitClearedText('props-primary-description');
      await assertUniqueId('props-primary-container');
      await assertUniqueId('props-primary-label');
      await click('props-title');
      await waitText('props-primary-title', 'Changed title');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      const resourceExpected = await text('props-resource-reference');
      expect(resourceExpected.length > 0).assertTrue();
      await click('props-resource');
      await waitText('props-primary-title', 'Changed title');
      await waitText('props-primary-description', resourceExpected);
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      expect(await text('props-primary-title')).assertEqual('Changed title');
      expect(await text('props-primary-description')).assertEqual(resourceExpected);
      const current = await bounds('props-primary-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-primary-row'), current);
      assertAbove(await bounds('props-primary-row'), await bounds('props-primary-divider'));
      await assertUniqueId('props-primary-label');
      await assertUniqueId('props-primary-symbol');
      await assertUniqueId('props-primary-title');
      await assertUniqueId('props-primary-description');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      expect(await text('props-primary-title')).assertEqual('Changed title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
    });

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDRESOURCE_0024
    // @tc.name AdaptCustomCardResource_0024
    // @tc.desc Verify props {"mode":"Resource","sibling":false,"clear":true,"resume":false,"first":"Symbol","restore":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardResource_0024', 0, async (): Promise<void> => {
      await openHistory('props');
      const passiveNode = await node('props-primary-symbol');
      await passiveNode.click();
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      const original = await bounds('props-primary-container');
      const siblingTitleBefore = await text('props-sibling-title');
      const siblingDescriptionBefore = await text('props-sibling-description');
      expect(siblingTitleBefore).assertEqual('Sibling title');
      expect(siblingDescriptionBefore).assertEqual('Sibling description');
      await click('props-clear-title');
      await waitClearedText('props-primary-title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      await click('props-clear-description');
      await waitClearedText('props-primary-description');
      await assertUniqueId('props-primary-container');
      await assertUniqueId('props-primary-label');
      await click('props-title');
      await waitText('props-primary-title', 'Changed title');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      const resourceExpected = await text('props-resource-reference');
      expect(resourceExpected.length > 0).assertTrue();
      await click('props-resource');
      await waitText('props-primary-title', 'Changed title');
      await waitText('props-primary-description', resourceExpected);
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      expect(await text('props-primary-title')).assertEqual('Changed title');
      expect(await text('props-primary-description')).assertEqual(resourceExpected);
      const current = await bounds('props-primary-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-primary-row'), current);
      assertAbove(await bounds('props-primary-row'), await bounds('props-primary-divider'));
      await assertUniqueId('props-primary-label');
      await assertUniqueId('props-primary-symbol');
      await assertUniqueId('props-primary-title');
      await assertUniqueId('props-primary-description');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      expect(await text('props-primary-title')).assertEqual('Changed title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      await click('props-reset');
      await waitText('props-primary-title', 'Primary title');
      await waitText('props-primary-description', 'Primary description');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      assertRectClose(await bounds('props-primary-container'), original);
      await assertUniqueId('props-primary-label');
      await assertIdAbsent('props-renamed-container');
    });

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDRESOURCE_0025
    // @tc.name AdaptCustomCardResource_0025
    // @tc.desc Verify props {"mode":"Resource","sibling":false,"clear":true,"resume":true,"first":"Label","restore":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardResource_0025', 0, async (): Promise<void> => {
      await openHistory('props');
      const passiveNode = await node('props-primary-label');
      await passiveNode.click();
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      const original = await bounds('props-primary-container');
      const siblingTitleBefore = await text('props-sibling-title');
      const siblingDescriptionBefore = await text('props-sibling-description');
      expect(siblingTitleBefore).assertEqual('Sibling title');
      expect(siblingDescriptionBefore).assertEqual('Sibling description');
      await click('props-clear-title');
      await waitClearedText('props-primary-title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      await click('props-clear-description');
      await waitClearedText('props-primary-description');
      await assertUniqueId('props-primary-container');
      await assertUniqueId('props-primary-label');
      await click('props-title');
      await waitText('props-primary-title', 'Changed title');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      const resourceExpected = await text('props-resource-reference');
      expect(resourceExpected.length > 0).assertTrue();
      await click('props-resource');
      await waitText('props-primary-title', 'Changed title');
      await waitText('props-primary-description', resourceExpected);
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      await backgroundAndRestore('FixtureAbility', 'props-primary-title', 'Changed title');
      expect(await text('props-primary-title')).assertEqual('Changed title');
      expect(await text('props-primary-description')).assertEqual(resourceExpected);
      const current = await bounds('props-primary-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-primary-row'), current);
      assertAbove(await bounds('props-primary-row'), await bounds('props-primary-divider'));
      await assertUniqueId('props-primary-label');
      await assertUniqueId('props-primary-symbol');
      await assertUniqueId('props-primary-title');
      await assertUniqueId('props-primary-description');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      expect(await text('props-primary-title')).assertEqual('Changed title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
    });

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDRESOURCE_0026
    // @tc.name AdaptCustomCardResource_0026
    // @tc.desc Verify props {"mode":"Resource","sibling":false,"clear":true,"resume":true,"first":"Label","restore":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardResource_0026', 0, async (): Promise<void> => {
      await openHistory('props');
      const passiveNode = await node('props-primary-label');
      await passiveNode.click();
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      const original = await bounds('props-primary-container');
      const siblingTitleBefore = await text('props-sibling-title');
      const siblingDescriptionBefore = await text('props-sibling-description');
      expect(siblingTitleBefore).assertEqual('Sibling title');
      expect(siblingDescriptionBefore).assertEqual('Sibling description');
      await click('props-clear-title');
      await waitClearedText('props-primary-title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      await click('props-clear-description');
      await waitClearedText('props-primary-description');
      await assertUniqueId('props-primary-container');
      await assertUniqueId('props-primary-label');
      await click('props-title');
      await waitText('props-primary-title', 'Changed title');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      const resourceExpected = await text('props-resource-reference');
      expect(resourceExpected.length > 0).assertTrue();
      await click('props-resource');
      await waitText('props-primary-title', 'Changed title');
      await waitText('props-primary-description', resourceExpected);
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      await backgroundAndRestore('FixtureAbility', 'props-primary-title', 'Changed title');
      expect(await text('props-primary-title')).assertEqual('Changed title');
      expect(await text('props-primary-description')).assertEqual(resourceExpected);
      const current = await bounds('props-primary-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-primary-row'), current);
      assertAbove(await bounds('props-primary-row'), await bounds('props-primary-divider'));
      await assertUniqueId('props-primary-label');
      await assertUniqueId('props-primary-symbol');
      await assertUniqueId('props-primary-title');
      await assertUniqueId('props-primary-description');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      expect(await text('props-primary-title')).assertEqual('Changed title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      await click('props-reset');
      await waitText('props-primary-title', 'Primary title');
      await waitText('props-primary-description', 'Primary description');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      assertRectClose(await bounds('props-primary-container'), original);
      await assertUniqueId('props-primary-label');
      await assertIdAbsent('props-renamed-container');
    });

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDRESOURCE_0027
    // @tc.name AdaptCustomCardResource_0027
    // @tc.desc Verify props {"mode":"Resource","sibling":false,"clear":true,"resume":true,"first":"Detail","restore":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardResource_0027', 0, async (): Promise<void> => {
      await openHistory('props');
      const passiveNode = await node('props-primary-detail');
      await passiveNode.click();
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      const original = await bounds('props-primary-container');
      const siblingTitleBefore = await text('props-sibling-title');
      const siblingDescriptionBefore = await text('props-sibling-description');
      expect(siblingTitleBefore).assertEqual('Sibling title');
      expect(siblingDescriptionBefore).assertEqual('Sibling description');
      await click('props-clear-title');
      await waitClearedText('props-primary-title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      await click('props-clear-description');
      await waitClearedText('props-primary-description');
      await assertUniqueId('props-primary-container');
      await assertUniqueId('props-primary-label');
      await click('props-title');
      await waitText('props-primary-title', 'Changed title');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      const resourceExpected = await text('props-resource-reference');
      expect(resourceExpected.length > 0).assertTrue();
      await click('props-resource');
      await waitText('props-primary-title', 'Changed title');
      await waitText('props-primary-description', resourceExpected);
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      await backgroundAndRestore('FixtureAbility', 'props-primary-title', 'Changed title');
      expect(await text('props-primary-title')).assertEqual('Changed title');
      expect(await text('props-primary-description')).assertEqual(resourceExpected);
      const current = await bounds('props-primary-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-primary-row'), current);
      assertAbove(await bounds('props-primary-row'), await bounds('props-primary-divider'));
      await assertUniqueId('props-primary-label');
      await assertUniqueId('props-primary-symbol');
      await assertUniqueId('props-primary-title');
      await assertUniqueId('props-primary-description');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      expect(await text('props-primary-title')).assertEqual('Changed title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
    });

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDRESOURCE_0028
    // @tc.name AdaptCustomCardResource_0028
    // @tc.desc Verify props {"mode":"Resource","sibling":false,"clear":true,"resume":true,"first":"Detail","restore":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardResource_0028', 0, async (): Promise<void> => {
      await openHistory('props');
      const passiveNode = await node('props-primary-detail');
      await passiveNode.click();
      expect(await text('props-primary-title')).assertEqual('Primary title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      const original = await bounds('props-primary-container');
      const siblingTitleBefore = await text('props-sibling-title');
      const siblingDescriptionBefore = await text('props-sibling-description');
      expect(siblingTitleBefore).assertEqual('Sibling title');
      expect(siblingDescriptionBefore).assertEqual('Sibling description');
      await click('props-clear-title');
      await waitClearedText('props-primary-title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      await click('props-clear-description');
      await waitClearedText('props-primary-description');
      await assertUniqueId('props-primary-container');
      await assertUniqueId('props-primary-label');
      await click('props-title');
      await waitText('props-primary-title', 'Changed title');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      const resourceExpected = await text('props-resource-reference');
      expect(resourceExpected.length > 0).assertTrue();
      await click('props-resource');
      await waitText('props-primary-title', 'Changed title');
      await waitText('props-primary-description', resourceExpected);
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      await backgroundAndRestore('FixtureAbility', 'props-primary-title', 'Changed title');
      expect(await text('props-primary-title')).assertEqual('Changed title');
      expect(await text('props-primary-description')).assertEqual(resourceExpected);
      const current = await bounds('props-primary-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-primary-row'), current);
      assertAbove(await bounds('props-primary-row'), await bounds('props-primary-divider'));
      await assertUniqueId('props-primary-label');
      await assertUniqueId('props-primary-symbol');
      await assertUniqueId('props-primary-title');
      await assertUniqueId('props-primary-description');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      expect(await text('props-primary-title')).assertEqual('Changed title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      await click('props-reset');
      await waitText('props-primary-title', 'Primary title');
      await waitText('props-primary-description', 'Primary description');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      assertRectClose(await bounds('props-primary-container'), original);
      await assertUniqueId('props-primary-label');
      await assertIdAbsent('props-renamed-container');
    });
  });
}
