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

// Reference: ets/test/Validation/ResourceLoaderValidation.test.ets (520 original lines).
// Explicit parameter cases are retained for independent DevEco selection and failure attribution.
export default function adaptCustomCardRekeyTests(): void {
  describe('AdaptCustomCardRekeyTest', (): void => {
    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDREKEY_0001
    // @tc.name AdaptCustomCardRekey_0001
    // @tc.desc Verify props {"mode":"Rekey","sibling":false,"clear":false,"resume":false,"first":"Label","restore":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardRekey_0001', 0, async (): Promise<void> => {
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
      await click('props-rekey');
      await assertIdAbsent('props-primary-container');
      await assertIdAbsent('props-primary-title');
      await assertIdAbsent('props-primary-description');
      await waitText('props-renamed-title', 'Primary title');
      await waitText('props-renamed-description', 'Primary description');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      expect(await text('props-renamed-title')).assertEqual('Primary title');
      expect(await text('props-renamed-description')).assertEqual('Primary description');
      const current = await bounds('props-renamed-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-renamed-row'), current);
      assertAbove(await bounds('props-renamed-row'), await bounds('props-renamed-divider'));
      await assertUniqueId('props-renamed-label');
      await assertUniqueId('props-renamed-symbol');
      await assertUniqueId('props-renamed-title');
      await assertUniqueId('props-renamed-description');
      await click('props-description');
      await waitText('props-renamed-description', 'Changed description');
      expect(await text('props-renamed-title')).assertEqual('Primary title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
    });

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDREKEY_0002
    // @tc.name AdaptCustomCardRekey_0002
    // @tc.desc Verify props {"mode":"Rekey","sibling":false,"clear":false,"resume":false,"first":"Label","restore":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardRekey_0002', 0, async (): Promise<void> => {
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
      await click('props-rekey');
      await assertIdAbsent('props-primary-container');
      await assertIdAbsent('props-primary-title');
      await assertIdAbsent('props-primary-description');
      await waitText('props-renamed-title', 'Primary title');
      await waitText('props-renamed-description', 'Primary description');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      expect(await text('props-renamed-title')).assertEqual('Primary title');
      expect(await text('props-renamed-description')).assertEqual('Primary description');
      const current = await bounds('props-renamed-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-renamed-row'), current);
      assertAbove(await bounds('props-renamed-row'), await bounds('props-renamed-divider'));
      await assertUniqueId('props-renamed-label');
      await assertUniqueId('props-renamed-symbol');
      await assertUniqueId('props-renamed-title');
      await assertUniqueId('props-renamed-description');
      await click('props-description');
      await waitText('props-renamed-description', 'Changed description');
      expect(await text('props-renamed-title')).assertEqual('Primary title');
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

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDREKEY_0003
    // @tc.name AdaptCustomCardRekey_0003
    // @tc.desc Verify props {"mode":"Rekey","sibling":false,"clear":false,"resume":false,"first":"Detail","restore":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardRekey_0003', 0, async (): Promise<void> => {
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
      await click('props-rekey');
      await assertIdAbsent('props-primary-container');
      await assertIdAbsent('props-primary-title');
      await assertIdAbsent('props-primary-description');
      await waitText('props-renamed-title', 'Primary title');
      await waitText('props-renamed-description', 'Primary description');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      expect(await text('props-renamed-title')).assertEqual('Primary title');
      expect(await text('props-renamed-description')).assertEqual('Primary description');
      const current = await bounds('props-renamed-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-renamed-row'), current);
      assertAbove(await bounds('props-renamed-row'), await bounds('props-renamed-divider'));
      await assertUniqueId('props-renamed-label');
      await assertUniqueId('props-renamed-symbol');
      await assertUniqueId('props-renamed-title');
      await assertUniqueId('props-renamed-description');
      await click('props-description');
      await waitText('props-renamed-description', 'Changed description');
      expect(await text('props-renamed-title')).assertEqual('Primary title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
    });

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDREKEY_0004
    // @tc.name AdaptCustomCardRekey_0004
    // @tc.desc Verify props {"mode":"Rekey","sibling":false,"clear":false,"resume":false,"first":"Detail","restore":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardRekey_0004', 0, async (): Promise<void> => {
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
      await click('props-rekey');
      await assertIdAbsent('props-primary-container');
      await assertIdAbsent('props-primary-title');
      await assertIdAbsent('props-primary-description');
      await waitText('props-renamed-title', 'Primary title');
      await waitText('props-renamed-description', 'Primary description');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      expect(await text('props-renamed-title')).assertEqual('Primary title');
      expect(await text('props-renamed-description')).assertEqual('Primary description');
      const current = await bounds('props-renamed-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-renamed-row'), current);
      assertAbove(await bounds('props-renamed-row'), await bounds('props-renamed-divider'));
      await assertUniqueId('props-renamed-label');
      await assertUniqueId('props-renamed-symbol');
      await assertUniqueId('props-renamed-title');
      await assertUniqueId('props-renamed-description');
      await click('props-description');
      await waitText('props-renamed-description', 'Changed description');
      expect(await text('props-renamed-title')).assertEqual('Primary title');
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

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDREKEY_0005
    // @tc.name AdaptCustomCardRekey_0005
    // @tc.desc Verify props {"mode":"Rekey","sibling":false,"clear":false,"resume":false,"first":"Divider","restore":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardRekey_0005', 0, async (): Promise<void> => {
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
      await click('props-rekey');
      await assertIdAbsent('props-primary-container');
      await assertIdAbsent('props-primary-title');
      await assertIdAbsent('props-primary-description');
      await waitText('props-renamed-title', 'Primary title');
      await waitText('props-renamed-description', 'Primary description');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      expect(await text('props-renamed-title')).assertEqual('Primary title');
      expect(await text('props-renamed-description')).assertEqual('Primary description');
      const current = await bounds('props-renamed-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-renamed-row'), current);
      assertAbove(await bounds('props-renamed-row'), await bounds('props-renamed-divider'));
      await assertUniqueId('props-renamed-label');
      await assertUniqueId('props-renamed-symbol');
      await assertUniqueId('props-renamed-title');
      await assertUniqueId('props-renamed-description');
      await click('props-description');
      await waitText('props-renamed-description', 'Changed description');
      expect(await text('props-renamed-title')).assertEqual('Primary title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
    });

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDREKEY_0006
    // @tc.name AdaptCustomCardRekey_0006
    // @tc.desc Verify props {"mode":"Rekey","sibling":false,"clear":false,"resume":false,"first":"Divider","restore":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardRekey_0006', 0, async (): Promise<void> => {
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
      await click('props-rekey');
      await assertIdAbsent('props-primary-container');
      await assertIdAbsent('props-primary-title');
      await assertIdAbsent('props-primary-description');
      await waitText('props-renamed-title', 'Primary title');
      await waitText('props-renamed-description', 'Primary description');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      expect(await text('props-renamed-title')).assertEqual('Primary title');
      expect(await text('props-renamed-description')).assertEqual('Primary description');
      const current = await bounds('props-renamed-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-renamed-row'), current);
      assertAbove(await bounds('props-renamed-row'), await bounds('props-renamed-divider'));
      await assertUniqueId('props-renamed-label');
      await assertUniqueId('props-renamed-symbol');
      await assertUniqueId('props-renamed-title');
      await assertUniqueId('props-renamed-description');
      await click('props-description');
      await waitText('props-renamed-description', 'Changed description');
      expect(await text('props-renamed-title')).assertEqual('Primary title');
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

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDREKEY_0007
    // @tc.name AdaptCustomCardRekey_0007
    // @tc.desc Verify props {"mode":"Rekey","sibling":false,"clear":false,"resume":false,"first":"Symbol","restore":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardRekey_0007', 0, async (): Promise<void> => {
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
      await click('props-rekey');
      await assertIdAbsent('props-primary-container');
      await assertIdAbsent('props-primary-title');
      await assertIdAbsent('props-primary-description');
      await waitText('props-renamed-title', 'Primary title');
      await waitText('props-renamed-description', 'Primary description');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      expect(await text('props-renamed-title')).assertEqual('Primary title');
      expect(await text('props-renamed-description')).assertEqual('Primary description');
      const current = await bounds('props-renamed-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-renamed-row'), current);
      assertAbove(await bounds('props-renamed-row'), await bounds('props-renamed-divider'));
      await assertUniqueId('props-renamed-label');
      await assertUniqueId('props-renamed-symbol');
      await assertUniqueId('props-renamed-title');
      await assertUniqueId('props-renamed-description');
      await click('props-description');
      await waitText('props-renamed-description', 'Changed description');
      expect(await text('props-renamed-title')).assertEqual('Primary title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
    });

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDREKEY_0008
    // @tc.name AdaptCustomCardRekey_0008
    // @tc.desc Verify props {"mode":"Rekey","sibling":false,"clear":false,"resume":false,"first":"Symbol","restore":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardRekey_0008', 0, async (): Promise<void> => {
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
      await click('props-rekey');
      await assertIdAbsent('props-primary-container');
      await assertIdAbsent('props-primary-title');
      await assertIdAbsent('props-primary-description');
      await waitText('props-renamed-title', 'Primary title');
      await waitText('props-renamed-description', 'Primary description');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      expect(await text('props-renamed-title')).assertEqual('Primary title');
      expect(await text('props-renamed-description')).assertEqual('Primary description');
      const current = await bounds('props-renamed-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-renamed-row'), current);
      assertAbove(await bounds('props-renamed-row'), await bounds('props-renamed-divider'));
      await assertUniqueId('props-renamed-label');
      await assertUniqueId('props-renamed-symbol');
      await assertUniqueId('props-renamed-title');
      await assertUniqueId('props-renamed-description');
      await click('props-description');
      await waitText('props-renamed-description', 'Changed description');
      expect(await text('props-renamed-title')).assertEqual('Primary title');
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

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDREKEY_0009
    // @tc.name AdaptCustomCardRekey_0009
    // @tc.desc Verify props {"mode":"Rekey","sibling":false,"clear":false,"resume":true,"first":"Label","restore":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardRekey_0009', 0, async (): Promise<void> => {
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
      await click('props-rekey');
      await assertIdAbsent('props-primary-container');
      await assertIdAbsent('props-primary-title');
      await assertIdAbsent('props-primary-description');
      await waitText('props-renamed-title', 'Primary title');
      await waitText('props-renamed-description', 'Primary description');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      await backgroundAndRestore('FixtureAbility', 'props-renamed-title', 'Primary title');
      expect(await text('props-renamed-title')).assertEqual('Primary title');
      expect(await text('props-renamed-description')).assertEqual('Primary description');
      const current = await bounds('props-renamed-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-renamed-row'), current);
      assertAbove(await bounds('props-renamed-row'), await bounds('props-renamed-divider'));
      await assertUniqueId('props-renamed-label');
      await assertUniqueId('props-renamed-symbol');
      await assertUniqueId('props-renamed-title');
      await assertUniqueId('props-renamed-description');
      await click('props-description');
      await waitText('props-renamed-description', 'Changed description');
      expect(await text('props-renamed-title')).assertEqual('Primary title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
    });

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDREKEY_0010
    // @tc.name AdaptCustomCardRekey_0010
    // @tc.desc Verify props {"mode":"Rekey","sibling":false,"clear":false,"resume":true,"first":"Label","restore":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardRekey_0010', 0, async (): Promise<void> => {
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
      await click('props-rekey');
      await assertIdAbsent('props-primary-container');
      await assertIdAbsent('props-primary-title');
      await assertIdAbsent('props-primary-description');
      await waitText('props-renamed-title', 'Primary title');
      await waitText('props-renamed-description', 'Primary description');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      await backgroundAndRestore('FixtureAbility', 'props-renamed-title', 'Primary title');
      expect(await text('props-renamed-title')).assertEqual('Primary title');
      expect(await text('props-renamed-description')).assertEqual('Primary description');
      const current = await bounds('props-renamed-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-renamed-row'), current);
      assertAbove(await bounds('props-renamed-row'), await bounds('props-renamed-divider'));
      await assertUniqueId('props-renamed-label');
      await assertUniqueId('props-renamed-symbol');
      await assertUniqueId('props-renamed-title');
      await assertUniqueId('props-renamed-description');
      await click('props-description');
      await waitText('props-renamed-description', 'Changed description');
      expect(await text('props-renamed-title')).assertEqual('Primary title');
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

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDREKEY_0011
    // @tc.name AdaptCustomCardRekey_0011
    // @tc.desc Verify props {"mode":"Rekey","sibling":false,"clear":false,"resume":true,"first":"Detail","restore":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardRekey_0011', 0, async (): Promise<void> => {
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
      await click('props-rekey');
      await assertIdAbsent('props-primary-container');
      await assertIdAbsent('props-primary-title');
      await assertIdAbsent('props-primary-description');
      await waitText('props-renamed-title', 'Primary title');
      await waitText('props-renamed-description', 'Primary description');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      await backgroundAndRestore('FixtureAbility', 'props-renamed-title', 'Primary title');
      expect(await text('props-renamed-title')).assertEqual('Primary title');
      expect(await text('props-renamed-description')).assertEqual('Primary description');
      const current = await bounds('props-renamed-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-renamed-row'), current);
      assertAbove(await bounds('props-renamed-row'), await bounds('props-renamed-divider'));
      await assertUniqueId('props-renamed-label');
      await assertUniqueId('props-renamed-symbol');
      await assertUniqueId('props-renamed-title');
      await assertUniqueId('props-renamed-description');
      await click('props-description');
      await waitText('props-renamed-description', 'Changed description');
      expect(await text('props-renamed-title')).assertEqual('Primary title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
    });

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDREKEY_0012
    // @tc.name AdaptCustomCardRekey_0012
    // @tc.desc Verify props {"mode":"Rekey","sibling":false,"clear":false,"resume":true,"first":"Detail","restore":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardRekey_0012', 0, async (): Promise<void> => {
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
      await click('props-rekey');
      await assertIdAbsent('props-primary-container');
      await assertIdAbsent('props-primary-title');
      await assertIdAbsent('props-primary-description');
      await waitText('props-renamed-title', 'Primary title');
      await waitText('props-renamed-description', 'Primary description');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      await backgroundAndRestore('FixtureAbility', 'props-renamed-title', 'Primary title');
      expect(await text('props-renamed-title')).assertEqual('Primary title');
      expect(await text('props-renamed-description')).assertEqual('Primary description');
      const current = await bounds('props-renamed-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-renamed-row'), current);
      assertAbove(await bounds('props-renamed-row'), await bounds('props-renamed-divider'));
      await assertUniqueId('props-renamed-label');
      await assertUniqueId('props-renamed-symbol');
      await assertUniqueId('props-renamed-title');
      await assertUniqueId('props-renamed-description');
      await click('props-description');
      await waitText('props-renamed-description', 'Changed description');
      expect(await text('props-renamed-title')).assertEqual('Primary title');
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

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDREKEY_0013
    // @tc.name AdaptCustomCardRekey_0013
    // @tc.desc Verify props {"mode":"Rekey","sibling":false,"clear":false,"resume":true,"first":"Divider","restore":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardRekey_0013', 0, async (): Promise<void> => {
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
      await click('props-rekey');
      await assertIdAbsent('props-primary-container');
      await assertIdAbsent('props-primary-title');
      await assertIdAbsent('props-primary-description');
      await waitText('props-renamed-title', 'Primary title');
      await waitText('props-renamed-description', 'Primary description');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      await backgroundAndRestore('FixtureAbility', 'props-renamed-title', 'Primary title');
      expect(await text('props-renamed-title')).assertEqual('Primary title');
      expect(await text('props-renamed-description')).assertEqual('Primary description');
      const current = await bounds('props-renamed-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-renamed-row'), current);
      assertAbove(await bounds('props-renamed-row'), await bounds('props-renamed-divider'));
      await assertUniqueId('props-renamed-label');
      await assertUniqueId('props-renamed-symbol');
      await assertUniqueId('props-renamed-title');
      await assertUniqueId('props-renamed-description');
      await click('props-description');
      await waitText('props-renamed-description', 'Changed description');
      expect(await text('props-renamed-title')).assertEqual('Primary title');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
    });

    // @tc.number SUB_SAMPLE_ADAPTCUSTOMCARDREKEY_0014
    // @tc.name AdaptCustomCardRekey_0014
    // @tc.desc Verify props {"mode":"Rekey","sibling":false,"clear":false,"resume":true,"first":"Divider","restore":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptCustomCardRekey_0014', 0, async (): Promise<void> => {
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
      await click('props-rekey');
      await assertIdAbsent('props-primary-container');
      await assertIdAbsent('props-primary-title');
      await assertIdAbsent('props-primary-description');
      await waitText('props-renamed-title', 'Primary title');
      await waitText('props-renamed-description', 'Primary description');
      expect(await text('props-sibling-title')).assertEqual(siblingTitleBefore);
      expect(await text('props-sibling-description')).assertEqual(siblingDescriptionBefore);
      await backgroundAndRestore('FixtureAbility', 'props-renamed-title', 'Primary title');
      expect(await text('props-renamed-title')).assertEqual('Primary title');
      expect(await text('props-renamed-description')).assertEqual('Primary description');
      const current = await bounds('props-renamed-container');
      assertPositiveRect(current);
      expect(Math.abs(current.left - original.left) <= 2).assertTrue();
      expect(Math.abs(current.right - original.right) <= 2).assertTrue();
      assertContained(await bounds('props-renamed-row'), current);
      assertAbove(await bounds('props-renamed-row'), await bounds('props-renamed-divider'));
      await assertUniqueId('props-renamed-label');
      await assertUniqueId('props-renamed-symbol');
      await assertUniqueId('props-renamed-title');
      await assertUniqueId('props-renamed-description');
      await click('props-description');
      await waitText('props-renamed-description', 'Changed description');
      expect(await text('props-renamed-title')).assertEqual('Primary title');
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
