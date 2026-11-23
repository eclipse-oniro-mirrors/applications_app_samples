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
import { TabScene, prepareTabScene, visibleBackgroundId, readTabTitle, activateTab,
  restoreTabScene, assertTabStructure } from './AdaptationMatrixDriver';
import { bounds, assertSelection, assertRectClose, assertUniqueId, waitForStableBounds } from './SharedDriver';

// Reference: ets/test/PowerValidation/PowerOfflineNetwork.test.ets (884 original lines).
// Explicit parameter cases are retained for independent DevEco selection and failure attribution.
export default function adaptTabFrom2InteriorResumeTests(): void {
  describe('AdaptTabFrom2InteriorResumeTest', (): void => {
    // @tc.number SUB_SAMPLE_ADAPTTABFROM2INTERIORRESUME_0001
    // @tc.name AdaptTabFrom2InteriorResume_0001
    // @tc.desc Verify tabUi {"initial":2,"viewport":"Interior","resume":true,"target":0,"hit":"Column","operation":"Select"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFrom2InteriorResume_0001', 0, async (): Promise<void> => {
      const scene: TabScene = { initial: 2, viewport: 'Interior', resume: true };
      await prepareTabScene(scene);
      const target: number = 0;
      const hitTarget: string = 'Column';
      const backgroundId = await visibleBackgroundId(scene.viewport);
      const backgroundBefore = await waitForStableBounds(backgroundId);
      const barBefore = await bounds('blur-tab-bar');
      const listBefore = await bounds('background-list');
      const itemBefore = await bounds('tab-item-' + target);
      const iconBefore = await bounds('tab-icon-' + target);
      const titleBefore = await readTabTitle(target);
      await assertTabStructure(target);
      await assertSelection(scene.initial);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      const titleAfter = await readTabTitle(target);
      expect(titleAfter.text).assertEqual(titleBefore.text);
      assertRectClose(titleAfter.rect, titleBefore.rect);
      assertRectClose(await bounds('tab-icon-' + target), iconBefore);
      assertRectClose(await bounds('tab-item-' + target), itemBefore);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await restoreTabScene(scene);
      await assertSelection(target);
      const restoredTitle = await readTabTitle(target);
      expect(restoredTitle.text).assertEqual(titleBefore.text);
      assertRectClose(restoredTitle.rect, titleBefore.rect);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await assertUniqueId('background-list');
      await assertUniqueId('blur-tab-bar');
      await assertTabStructure(target);
      await assertTabStructure((target + 1) % 4);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABFROM2INTERIORRESUME_0002
    // @tc.name AdaptTabFrom2InteriorResume_0002
    // @tc.desc Verify tabUi {"initial":2,"viewport":"Interior","resume":true,"target":0,"hit":"Title","operation":"Reselect"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFrom2InteriorResume_0002', 0, async (): Promise<void> => {
      const scene: TabScene = { initial: 2, viewport: 'Interior', resume: true };
      await prepareTabScene(scene);
      const target: number = 0;
      const hitTarget: string = 'Title';
      const backgroundId = await visibleBackgroundId(scene.viewport);
      const backgroundBefore = await waitForStableBounds(backgroundId);
      const barBefore = await bounds('blur-tab-bar');
      const listBefore = await bounds('background-list');
      const itemBefore = await bounds('tab-item-' + target);
      const iconBefore = await bounds('tab-icon-' + target);
      const titleBefore = await readTabTitle(target);
      await assertTabStructure(target);
      await assertSelection(scene.initial);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      const titleAfter = await readTabTitle(target);
      expect(titleAfter.text).assertEqual(titleBefore.text);
      assertRectClose(titleAfter.rect, titleBefore.rect);
      assertRectClose(await bounds('tab-icon-' + target), iconBefore);
      assertRectClose(await bounds('tab-item-' + target), itemBefore);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      const repeatedTitle = await readTabTitle(target);
      expect(repeatedTitle.text).assertEqual(titleBefore.text);
      assertRectClose(repeatedTitle.rect, titleBefore.rect);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await restoreTabScene(scene);
      await assertSelection(target);
      const restoredTitle = await readTabTitle(target);
      expect(restoredTitle.text).assertEqual(titleBefore.text);
      assertRectClose(restoredTitle.rect, titleBefore.rect);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await assertUniqueId('background-list');
      await assertUniqueId('blur-tab-bar');
      await assertTabStructure(target);
      await assertTabStructure((target + 1) % 4);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABFROM2INTERIORRESUME_0003
    // @tc.name AdaptTabFrom2InteriorResume_0003
    // @tc.desc Verify tabUi {"initial":2,"viewport":"Interior","resume":true,"target":0,"hit":"Icon","operation":"RoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFrom2InteriorResume_0003', 0, async (): Promise<void> => {
      const scene: TabScene = { initial: 2, viewport: 'Interior', resume: true };
      await prepareTabScene(scene);
      const target: number = 0;
      const hitTarget: string = 'Icon';
      const backgroundId = await visibleBackgroundId(scene.viewport);
      const backgroundBefore = await waitForStableBounds(backgroundId);
      const barBefore = await bounds('blur-tab-bar');
      const listBefore = await bounds('background-list');
      const itemBefore = await bounds('tab-item-' + target);
      const iconBefore = await bounds('tab-icon-' + target);
      const titleBefore = await readTabTitle(target);
      await assertTabStructure(target);
      await assertSelection(scene.initial);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      const titleAfter = await readTabTitle(target);
      expect(titleAfter.text).assertEqual(titleBefore.text);
      assertRectClose(titleAfter.rect, titleBefore.rect);
      assertRectClose(await bounds('tab-icon-' + target), iconBefore);
      assertRectClose(await bounds('tab-item-' + target), itemBefore);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await activateTab(scene.initial, hitTarget);
      await assertSelection(scene.initial);
      assertRectClose(await bounds('tab-item-' + target), itemBefore);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      await restoreTabScene(scene);
      await assertSelection(target);
      const restoredTitle = await readTabTitle(target);
      expect(restoredTitle.text).assertEqual(titleBefore.text);
      assertRectClose(restoredTitle.rect, titleBefore.rect);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await assertUniqueId('background-list');
      await assertUniqueId('blur-tab-bar');
      await assertTabStructure(target);
      await assertTabStructure((target + 1) % 4);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABFROM2INTERIORRESUME_0004
    // @tc.name AdaptTabFrom2InteriorResume_0004
    // @tc.desc Verify tabUi {"initial":2,"viewport":"Interior","resume":true,"target":0,"hit":"Gutter","operation":"Select"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFrom2InteriorResume_0004', 0, async (): Promise<void> => {
      const scene: TabScene = { initial: 2, viewport: 'Interior', resume: true };
      await prepareTabScene(scene);
      const target: number = 0;
      const hitTarget: string = 'Gutter';
      const backgroundId = await visibleBackgroundId(scene.viewport);
      const backgroundBefore = await waitForStableBounds(backgroundId);
      const barBefore = await bounds('blur-tab-bar');
      const listBefore = await bounds('background-list');
      const itemBefore = await bounds('tab-item-' + target);
      const iconBefore = await bounds('tab-icon-' + target);
      const titleBefore = await readTabTitle(target);
      await assertTabStructure(target);
      await assertSelection(scene.initial);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      const titleAfter = await readTabTitle(target);
      expect(titleAfter.text).assertEqual(titleBefore.text);
      assertRectClose(titleAfter.rect, titleBefore.rect);
      assertRectClose(await bounds('tab-icon-' + target), iconBefore);
      assertRectClose(await bounds('tab-item-' + target), itemBefore);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await restoreTabScene(scene);
      await assertSelection(target);
      const restoredTitle = await readTabTitle(target);
      expect(restoredTitle.text).assertEqual(titleBefore.text);
      assertRectClose(restoredTitle.rect, titleBefore.rect);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await assertUniqueId('background-list');
      await assertUniqueId('blur-tab-bar');
      await assertTabStructure(target);
      await assertTabStructure((target + 1) % 4);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABFROM2INTERIORRESUME_0005
    // @tc.name AdaptTabFrom2InteriorResume_0005
    // @tc.desc Verify tabUi {"initial":2,"viewport":"Interior","resume":true,"target":1,"hit":"Column","operation":"Reselect"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFrom2InteriorResume_0005', 0, async (): Promise<void> => {
      const scene: TabScene = { initial: 2, viewport: 'Interior', resume: true };
      await prepareTabScene(scene);
      const target: number = 1;
      const hitTarget: string = 'Column';
      const backgroundId = await visibleBackgroundId(scene.viewport);
      const backgroundBefore = await waitForStableBounds(backgroundId);
      const barBefore = await bounds('blur-tab-bar');
      const listBefore = await bounds('background-list');
      const itemBefore = await bounds('tab-item-' + target);
      const iconBefore = await bounds('tab-icon-' + target);
      const titleBefore = await readTabTitle(target);
      await assertTabStructure(target);
      await assertSelection(scene.initial);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      const titleAfter = await readTabTitle(target);
      expect(titleAfter.text).assertEqual(titleBefore.text);
      assertRectClose(titleAfter.rect, titleBefore.rect);
      assertRectClose(await bounds('tab-icon-' + target), iconBefore);
      assertRectClose(await bounds('tab-item-' + target), itemBefore);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      const repeatedTitle = await readTabTitle(target);
      expect(repeatedTitle.text).assertEqual(titleBefore.text);
      assertRectClose(repeatedTitle.rect, titleBefore.rect);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await restoreTabScene(scene);
      await assertSelection(target);
      const restoredTitle = await readTabTitle(target);
      expect(restoredTitle.text).assertEqual(titleBefore.text);
      assertRectClose(restoredTitle.rect, titleBefore.rect);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await assertUniqueId('background-list');
      await assertUniqueId('blur-tab-bar');
      await assertTabStructure(target);
      await assertTabStructure((target + 1) % 4);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABFROM2INTERIORRESUME_0006
    // @tc.name AdaptTabFrom2InteriorResume_0006
    // @tc.desc Verify tabUi {"initial":2,"viewport":"Interior","resume":true,"target":1,"hit":"Title","operation":"RoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFrom2InteriorResume_0006', 0, async (): Promise<void> => {
      const scene: TabScene = { initial: 2, viewport: 'Interior', resume: true };
      await prepareTabScene(scene);
      const target: number = 1;
      const hitTarget: string = 'Title';
      const backgroundId = await visibleBackgroundId(scene.viewport);
      const backgroundBefore = await waitForStableBounds(backgroundId);
      const barBefore = await bounds('blur-tab-bar');
      const listBefore = await bounds('background-list');
      const itemBefore = await bounds('tab-item-' + target);
      const iconBefore = await bounds('tab-icon-' + target);
      const titleBefore = await readTabTitle(target);
      await assertTabStructure(target);
      await assertSelection(scene.initial);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      const titleAfter = await readTabTitle(target);
      expect(titleAfter.text).assertEqual(titleBefore.text);
      assertRectClose(titleAfter.rect, titleBefore.rect);
      assertRectClose(await bounds('tab-icon-' + target), iconBefore);
      assertRectClose(await bounds('tab-item-' + target), itemBefore);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await activateTab(scene.initial, hitTarget);
      await assertSelection(scene.initial);
      assertRectClose(await bounds('tab-item-' + target), itemBefore);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      await restoreTabScene(scene);
      await assertSelection(target);
      const restoredTitle = await readTabTitle(target);
      expect(restoredTitle.text).assertEqual(titleBefore.text);
      assertRectClose(restoredTitle.rect, titleBefore.rect);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await assertUniqueId('background-list');
      await assertUniqueId('blur-tab-bar');
      await assertTabStructure(target);
      await assertTabStructure((target + 1) % 4);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABFROM2INTERIORRESUME_0007
    // @tc.name AdaptTabFrom2InteriorResume_0007
    // @tc.desc Verify tabUi {"initial":2,"viewport":"Interior","resume":true,"target":1,"hit":"Icon","operation":"Select"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFrom2InteriorResume_0007', 0, async (): Promise<void> => {
      const scene: TabScene = { initial: 2, viewport: 'Interior', resume: true };
      await prepareTabScene(scene);
      const target: number = 1;
      const hitTarget: string = 'Icon';
      const backgroundId = await visibleBackgroundId(scene.viewport);
      const backgroundBefore = await waitForStableBounds(backgroundId);
      const barBefore = await bounds('blur-tab-bar');
      const listBefore = await bounds('background-list');
      const itemBefore = await bounds('tab-item-' + target);
      const iconBefore = await bounds('tab-icon-' + target);
      const titleBefore = await readTabTitle(target);
      await assertTabStructure(target);
      await assertSelection(scene.initial);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      const titleAfter = await readTabTitle(target);
      expect(titleAfter.text).assertEqual(titleBefore.text);
      assertRectClose(titleAfter.rect, titleBefore.rect);
      assertRectClose(await bounds('tab-icon-' + target), iconBefore);
      assertRectClose(await bounds('tab-item-' + target), itemBefore);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await restoreTabScene(scene);
      await assertSelection(target);
      const restoredTitle = await readTabTitle(target);
      expect(restoredTitle.text).assertEqual(titleBefore.text);
      assertRectClose(restoredTitle.rect, titleBefore.rect);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await assertUniqueId('background-list');
      await assertUniqueId('blur-tab-bar');
      await assertTabStructure(target);
      await assertTabStructure((target + 1) % 4);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABFROM2INTERIORRESUME_0008
    // @tc.name AdaptTabFrom2InteriorResume_0008
    // @tc.desc Verify tabUi {"initial":2,"viewport":"Interior","resume":true,"target":1,"hit":"Gutter","operation":"Reselect"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFrom2InteriorResume_0008', 0, async (): Promise<void> => {
      const scene: TabScene = { initial: 2, viewport: 'Interior', resume: true };
      await prepareTabScene(scene);
      const target: number = 1;
      const hitTarget: string = 'Gutter';
      const backgroundId = await visibleBackgroundId(scene.viewport);
      const backgroundBefore = await waitForStableBounds(backgroundId);
      const barBefore = await bounds('blur-tab-bar');
      const listBefore = await bounds('background-list');
      const itemBefore = await bounds('tab-item-' + target);
      const iconBefore = await bounds('tab-icon-' + target);
      const titleBefore = await readTabTitle(target);
      await assertTabStructure(target);
      await assertSelection(scene.initial);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      const titleAfter = await readTabTitle(target);
      expect(titleAfter.text).assertEqual(titleBefore.text);
      assertRectClose(titleAfter.rect, titleBefore.rect);
      assertRectClose(await bounds('tab-icon-' + target), iconBefore);
      assertRectClose(await bounds('tab-item-' + target), itemBefore);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      const repeatedTitle = await readTabTitle(target);
      expect(repeatedTitle.text).assertEqual(titleBefore.text);
      assertRectClose(repeatedTitle.rect, titleBefore.rect);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await restoreTabScene(scene);
      await assertSelection(target);
      const restoredTitle = await readTabTitle(target);
      expect(restoredTitle.text).assertEqual(titleBefore.text);
      assertRectClose(restoredTitle.rect, titleBefore.rect);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await assertUniqueId('background-list');
      await assertUniqueId('blur-tab-bar');
      await assertTabStructure(target);
      await assertTabStructure((target + 1) % 4);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABFROM2INTERIORRESUME_0009
    // @tc.name AdaptTabFrom2InteriorResume_0009
    // @tc.desc Verify tabUi {"initial":2,"viewport":"Interior","resume":true,"target":2,"hit":"Column","operation":"RoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFrom2InteriorResume_0009', 0, async (): Promise<void> => {
      const scene: TabScene = { initial: 2, viewport: 'Interior', resume: true };
      await prepareTabScene(scene);
      const target: number = 2;
      const hitTarget: string = 'Column';
      const backgroundId = await visibleBackgroundId(scene.viewport);
      const backgroundBefore = await waitForStableBounds(backgroundId);
      const barBefore = await bounds('blur-tab-bar');
      const listBefore = await bounds('background-list');
      const itemBefore = await bounds('tab-item-' + target);
      const iconBefore = await bounds('tab-icon-' + target);
      const titleBefore = await readTabTitle(target);
      await assertTabStructure(target);
      await assertSelection(scene.initial);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      const titleAfter = await readTabTitle(target);
      expect(titleAfter.text).assertEqual(titleBefore.text);
      assertRectClose(titleAfter.rect, titleBefore.rect);
      assertRectClose(await bounds('tab-icon-' + target), iconBefore);
      assertRectClose(await bounds('tab-item-' + target), itemBefore);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await activateTab(scene.initial, hitTarget);
      await assertSelection(scene.initial);
      assertRectClose(await bounds('tab-item-' + target), itemBefore);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      await restoreTabScene(scene);
      await assertSelection(target);
      const restoredTitle = await readTabTitle(target);
      expect(restoredTitle.text).assertEqual(titleBefore.text);
      assertRectClose(restoredTitle.rect, titleBefore.rect);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await assertUniqueId('background-list');
      await assertUniqueId('blur-tab-bar');
      await assertTabStructure(target);
      await assertTabStructure((target + 1) % 4);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABFROM2INTERIORRESUME_0010
    // @tc.name AdaptTabFrom2InteriorResume_0010
    // @tc.desc Verify tabUi {"initial":2,"viewport":"Interior","resume":true,"target":2,"hit":"Title","operation":"Select"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFrom2InteriorResume_0010', 0, async (): Promise<void> => {
      const scene: TabScene = { initial: 2, viewport: 'Interior', resume: true };
      await prepareTabScene(scene);
      const target: number = 2;
      const hitTarget: string = 'Title';
      const backgroundId = await visibleBackgroundId(scene.viewport);
      const backgroundBefore = await waitForStableBounds(backgroundId);
      const barBefore = await bounds('blur-tab-bar');
      const listBefore = await bounds('background-list');
      const itemBefore = await bounds('tab-item-' + target);
      const iconBefore = await bounds('tab-icon-' + target);
      const titleBefore = await readTabTitle(target);
      await assertTabStructure(target);
      await assertSelection(scene.initial);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      const titleAfter = await readTabTitle(target);
      expect(titleAfter.text).assertEqual(titleBefore.text);
      assertRectClose(titleAfter.rect, titleBefore.rect);
      assertRectClose(await bounds('tab-icon-' + target), iconBefore);
      assertRectClose(await bounds('tab-item-' + target), itemBefore);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await restoreTabScene(scene);
      await assertSelection(target);
      const restoredTitle = await readTabTitle(target);
      expect(restoredTitle.text).assertEqual(titleBefore.text);
      assertRectClose(restoredTitle.rect, titleBefore.rect);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await assertUniqueId('background-list');
      await assertUniqueId('blur-tab-bar');
      await assertTabStructure(target);
      await assertTabStructure((target + 1) % 4);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABFROM2INTERIORRESUME_0011
    // @tc.name AdaptTabFrom2InteriorResume_0011
    // @tc.desc Verify tabUi {"initial":2,"viewport":"Interior","resume":true,"target":2,"hit":"Icon","operation":"Reselect"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFrom2InteriorResume_0011', 0, async (): Promise<void> => {
      const scene: TabScene = { initial: 2, viewport: 'Interior', resume: true };
      await prepareTabScene(scene);
      const target: number = 2;
      const hitTarget: string = 'Icon';
      const backgroundId = await visibleBackgroundId(scene.viewport);
      const backgroundBefore = await waitForStableBounds(backgroundId);
      const barBefore = await bounds('blur-tab-bar');
      const listBefore = await bounds('background-list');
      const itemBefore = await bounds('tab-item-' + target);
      const iconBefore = await bounds('tab-icon-' + target);
      const titleBefore = await readTabTitle(target);
      await assertTabStructure(target);
      await assertSelection(scene.initial);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      const titleAfter = await readTabTitle(target);
      expect(titleAfter.text).assertEqual(titleBefore.text);
      assertRectClose(titleAfter.rect, titleBefore.rect);
      assertRectClose(await bounds('tab-icon-' + target), iconBefore);
      assertRectClose(await bounds('tab-item-' + target), itemBefore);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      const repeatedTitle = await readTabTitle(target);
      expect(repeatedTitle.text).assertEqual(titleBefore.text);
      assertRectClose(repeatedTitle.rect, titleBefore.rect);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await restoreTabScene(scene);
      await assertSelection(target);
      const restoredTitle = await readTabTitle(target);
      expect(restoredTitle.text).assertEqual(titleBefore.text);
      assertRectClose(restoredTitle.rect, titleBefore.rect);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await assertUniqueId('background-list');
      await assertUniqueId('blur-tab-bar');
      await assertTabStructure(target);
      await assertTabStructure((target + 1) % 4);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABFROM2INTERIORRESUME_0012
    // @tc.name AdaptTabFrom2InteriorResume_0012
    // @tc.desc Verify tabUi {"initial":2,"viewport":"Interior","resume":true,"target":2,"hit":"Gutter","operation":"RoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFrom2InteriorResume_0012', 0, async (): Promise<void> => {
      const scene: TabScene = { initial: 2, viewport: 'Interior', resume: true };
      await prepareTabScene(scene);
      const target: number = 2;
      const hitTarget: string = 'Gutter';
      const backgroundId = await visibleBackgroundId(scene.viewport);
      const backgroundBefore = await waitForStableBounds(backgroundId);
      const barBefore = await bounds('blur-tab-bar');
      const listBefore = await bounds('background-list');
      const itemBefore = await bounds('tab-item-' + target);
      const iconBefore = await bounds('tab-icon-' + target);
      const titleBefore = await readTabTitle(target);
      await assertTabStructure(target);
      await assertSelection(scene.initial);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      const titleAfter = await readTabTitle(target);
      expect(titleAfter.text).assertEqual(titleBefore.text);
      assertRectClose(titleAfter.rect, titleBefore.rect);
      assertRectClose(await bounds('tab-icon-' + target), iconBefore);
      assertRectClose(await bounds('tab-item-' + target), itemBefore);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await activateTab(scene.initial, hitTarget);
      await assertSelection(scene.initial);
      assertRectClose(await bounds('tab-item-' + target), itemBefore);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      await restoreTabScene(scene);
      await assertSelection(target);
      const restoredTitle = await readTabTitle(target);
      expect(restoredTitle.text).assertEqual(titleBefore.text);
      assertRectClose(restoredTitle.rect, titleBefore.rect);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await assertUniqueId('background-list');
      await assertUniqueId('blur-tab-bar');
      await assertTabStructure(target);
      await assertTabStructure((target + 1) % 4);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABFROM2INTERIORRESUME_0013
    // @tc.name AdaptTabFrom2InteriorResume_0013
    // @tc.desc Verify tabUi {"initial":2,"viewport":"Interior","resume":true,"target":3,"hit":"Column","operation":"Select"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFrom2InteriorResume_0013', 0, async (): Promise<void> => {
      const scene: TabScene = { initial: 2, viewport: 'Interior', resume: true };
      await prepareTabScene(scene);
      const target: number = 3;
      const hitTarget: string = 'Column';
      const backgroundId = await visibleBackgroundId(scene.viewport);
      const backgroundBefore = await waitForStableBounds(backgroundId);
      const barBefore = await bounds('blur-tab-bar');
      const listBefore = await bounds('background-list');
      const itemBefore = await bounds('tab-item-' + target);
      const iconBefore = await bounds('tab-icon-' + target);
      const titleBefore = await readTabTitle(target);
      await assertTabStructure(target);
      await assertSelection(scene.initial);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      const titleAfter = await readTabTitle(target);
      expect(titleAfter.text).assertEqual(titleBefore.text);
      assertRectClose(titleAfter.rect, titleBefore.rect);
      assertRectClose(await bounds('tab-icon-' + target), iconBefore);
      assertRectClose(await bounds('tab-item-' + target), itemBefore);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await restoreTabScene(scene);
      await assertSelection(target);
      const restoredTitle = await readTabTitle(target);
      expect(restoredTitle.text).assertEqual(titleBefore.text);
      assertRectClose(restoredTitle.rect, titleBefore.rect);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await assertUniqueId('background-list');
      await assertUniqueId('blur-tab-bar');
      await assertTabStructure(target);
      await assertTabStructure((target + 1) % 4);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABFROM2INTERIORRESUME_0014
    // @tc.name AdaptTabFrom2InteriorResume_0014
    // @tc.desc Verify tabUi {"initial":2,"viewport":"Interior","resume":true,"target":3,"hit":"Title","operation":"Reselect"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFrom2InteriorResume_0014', 0, async (): Promise<void> => {
      const scene: TabScene = { initial: 2, viewport: 'Interior', resume: true };
      await prepareTabScene(scene);
      const target: number = 3;
      const hitTarget: string = 'Title';
      const backgroundId = await visibleBackgroundId(scene.viewport);
      const backgroundBefore = await waitForStableBounds(backgroundId);
      const barBefore = await bounds('blur-tab-bar');
      const listBefore = await bounds('background-list');
      const itemBefore = await bounds('tab-item-' + target);
      const iconBefore = await bounds('tab-icon-' + target);
      const titleBefore = await readTabTitle(target);
      await assertTabStructure(target);
      await assertSelection(scene.initial);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      const titleAfter = await readTabTitle(target);
      expect(titleAfter.text).assertEqual(titleBefore.text);
      assertRectClose(titleAfter.rect, titleBefore.rect);
      assertRectClose(await bounds('tab-icon-' + target), iconBefore);
      assertRectClose(await bounds('tab-item-' + target), itemBefore);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      const repeatedTitle = await readTabTitle(target);
      expect(repeatedTitle.text).assertEqual(titleBefore.text);
      assertRectClose(repeatedTitle.rect, titleBefore.rect);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await restoreTabScene(scene);
      await assertSelection(target);
      const restoredTitle = await readTabTitle(target);
      expect(restoredTitle.text).assertEqual(titleBefore.text);
      assertRectClose(restoredTitle.rect, titleBefore.rect);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await assertUniqueId('background-list');
      await assertUniqueId('blur-tab-bar');
      await assertTabStructure(target);
      await assertTabStructure((target + 1) % 4);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABFROM2INTERIORRESUME_0015
    // @tc.name AdaptTabFrom2InteriorResume_0015
    // @tc.desc Verify tabUi {"initial":2,"viewport":"Interior","resume":true,"target":3,"hit":"Icon","operation":"RoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFrom2InteriorResume_0015', 0, async (): Promise<void> => {
      const scene: TabScene = { initial: 2, viewport: 'Interior', resume: true };
      await prepareTabScene(scene);
      const target: number = 3;
      const hitTarget: string = 'Icon';
      const backgroundId = await visibleBackgroundId(scene.viewport);
      const backgroundBefore = await waitForStableBounds(backgroundId);
      const barBefore = await bounds('blur-tab-bar');
      const listBefore = await bounds('background-list');
      const itemBefore = await bounds('tab-item-' + target);
      const iconBefore = await bounds('tab-icon-' + target);
      const titleBefore = await readTabTitle(target);
      await assertTabStructure(target);
      await assertSelection(scene.initial);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      const titleAfter = await readTabTitle(target);
      expect(titleAfter.text).assertEqual(titleBefore.text);
      assertRectClose(titleAfter.rect, titleBefore.rect);
      assertRectClose(await bounds('tab-icon-' + target), iconBefore);
      assertRectClose(await bounds('tab-item-' + target), itemBefore);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await activateTab(scene.initial, hitTarget);
      await assertSelection(scene.initial);
      assertRectClose(await bounds('tab-item-' + target), itemBefore);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      await restoreTabScene(scene);
      await assertSelection(target);
      const restoredTitle = await readTabTitle(target);
      expect(restoredTitle.text).assertEqual(titleBefore.text);
      assertRectClose(restoredTitle.rect, titleBefore.rect);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await assertUniqueId('background-list');
      await assertUniqueId('blur-tab-bar');
      await assertTabStructure(target);
      await assertTabStructure((target + 1) % 4);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABFROM2INTERIORRESUME_0016
    // @tc.name AdaptTabFrom2InteriorResume_0016
    // @tc.desc Verify tabUi {"initial":2,"viewport":"Interior","resume":true,"target":3,"hit":"Gutter","operation":"Select"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFrom2InteriorResume_0016', 0, async (): Promise<void> => {
      const scene: TabScene = { initial: 2, viewport: 'Interior', resume: true };
      await prepareTabScene(scene);
      const target: number = 3;
      const hitTarget: string = 'Gutter';
      const backgroundId = await visibleBackgroundId(scene.viewport);
      const backgroundBefore = await waitForStableBounds(backgroundId);
      const barBefore = await bounds('blur-tab-bar');
      const listBefore = await bounds('background-list');
      const itemBefore = await bounds('tab-item-' + target);
      const iconBefore = await bounds('tab-icon-' + target);
      const titleBefore = await readTabTitle(target);
      await assertTabStructure(target);
      await assertSelection(scene.initial);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      const titleAfter = await readTabTitle(target);
      expect(titleAfter.text).assertEqual(titleBefore.text);
      assertRectClose(titleAfter.rect, titleBefore.rect);
      assertRectClose(await bounds('tab-icon-' + target), iconBefore);
      assertRectClose(await bounds('tab-item-' + target), itemBefore);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await restoreTabScene(scene);
      await assertSelection(target);
      const restoredTitle = await readTabTitle(target);
      expect(restoredTitle.text).assertEqual(titleBefore.text);
      assertRectClose(restoredTitle.rect, titleBefore.rect);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await assertUniqueId('background-list');
      await assertUniqueId('blur-tab-bar');
      await assertTabStructure(target);
      await assertTabStructure((target + 1) % 4);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABFROM2INTERIORRESUME_0017
    // @tc.name AdaptTabFrom2InteriorResume_0017
    // @tc.desc Verify tabUi {"initial":2,"viewport":"Interior","resume":true,"target":0,"hit":"Column","operation":"Reselect"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFrom2InteriorResume_0017', 0, async (): Promise<void> => {
      const scene: TabScene = { initial: 2, viewport: 'Interior', resume: true };
      await prepareTabScene(scene);
      const target: number = 0;
      const hitTarget: string = 'Column';
      const backgroundId = await visibleBackgroundId(scene.viewport);
      const backgroundBefore = await waitForStableBounds(backgroundId);
      const barBefore = await bounds('blur-tab-bar');
      const listBefore = await bounds('background-list');
      const itemBefore = await bounds('tab-item-' + target);
      const iconBefore = await bounds('tab-icon-' + target);
      const titleBefore = await readTabTitle(target);
      await assertTabStructure(target);
      await assertSelection(scene.initial);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      const titleAfter = await readTabTitle(target);
      expect(titleAfter.text).assertEqual(titleBefore.text);
      assertRectClose(titleAfter.rect, titleBefore.rect);
      assertRectClose(await bounds('tab-icon-' + target), iconBefore);
      assertRectClose(await bounds('tab-item-' + target), itemBefore);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      const repeatedTitle = await readTabTitle(target);
      expect(repeatedTitle.text).assertEqual(titleBefore.text);
      assertRectClose(repeatedTitle.rect, titleBefore.rect);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await restoreTabScene(scene);
      await assertSelection(target);
      const restoredTitle = await readTabTitle(target);
      expect(restoredTitle.text).assertEqual(titleBefore.text);
      assertRectClose(restoredTitle.rect, titleBefore.rect);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await assertUniqueId('background-list');
      await assertUniqueId('blur-tab-bar');
      await assertTabStructure(target);
      await assertTabStructure((target + 1) % 4);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABFROM2INTERIORRESUME_0018
    // @tc.name AdaptTabFrom2InteriorResume_0018
    // @tc.desc Verify tabUi {"initial":2,"viewport":"Interior","resume":true,"target":0,"hit":"Title","operation":"RoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFrom2InteriorResume_0018', 0, async (): Promise<void> => {
      const scene: TabScene = { initial: 2, viewport: 'Interior', resume: true };
      await prepareTabScene(scene);
      const target: number = 0;
      const hitTarget: string = 'Title';
      const backgroundId = await visibleBackgroundId(scene.viewport);
      const backgroundBefore = await waitForStableBounds(backgroundId);
      const barBefore = await bounds('blur-tab-bar');
      const listBefore = await bounds('background-list');
      const itemBefore = await bounds('tab-item-' + target);
      const iconBefore = await bounds('tab-icon-' + target);
      const titleBefore = await readTabTitle(target);
      await assertTabStructure(target);
      await assertSelection(scene.initial);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      const titleAfter = await readTabTitle(target);
      expect(titleAfter.text).assertEqual(titleBefore.text);
      assertRectClose(titleAfter.rect, titleBefore.rect);
      assertRectClose(await bounds('tab-icon-' + target), iconBefore);
      assertRectClose(await bounds('tab-item-' + target), itemBefore);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await activateTab(scene.initial, hitTarget);
      await assertSelection(scene.initial);
      assertRectClose(await bounds('tab-item-' + target), itemBefore);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      await restoreTabScene(scene);
      await assertSelection(target);
      const restoredTitle = await readTabTitle(target);
      expect(restoredTitle.text).assertEqual(titleBefore.text);
      assertRectClose(restoredTitle.rect, titleBefore.rect);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await assertUniqueId('background-list');
      await assertUniqueId('blur-tab-bar');
      await assertTabStructure(target);
      await assertTabStructure((target + 1) % 4);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABFROM2INTERIORRESUME_0019
    // @tc.name AdaptTabFrom2InteriorResume_0019
    // @tc.desc Verify tabUi {"initial":2,"viewport":"Interior","resume":true,"target":0,"hit":"Icon","operation":"Select"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFrom2InteriorResume_0019', 0, async (): Promise<void> => {
      const scene: TabScene = { initial: 2, viewport: 'Interior', resume: true };
      await prepareTabScene(scene);
      const target: number = 0;
      const hitTarget: string = 'Icon';
      const backgroundId = await visibleBackgroundId(scene.viewport);
      const backgroundBefore = await waitForStableBounds(backgroundId);
      const barBefore = await bounds('blur-tab-bar');
      const listBefore = await bounds('background-list');
      const itemBefore = await bounds('tab-item-' + target);
      const iconBefore = await bounds('tab-icon-' + target);
      const titleBefore = await readTabTitle(target);
      await assertTabStructure(target);
      await assertSelection(scene.initial);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      const titleAfter = await readTabTitle(target);
      expect(titleAfter.text).assertEqual(titleBefore.text);
      assertRectClose(titleAfter.rect, titleBefore.rect);
      assertRectClose(await bounds('tab-icon-' + target), iconBefore);
      assertRectClose(await bounds('tab-item-' + target), itemBefore);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await restoreTabScene(scene);
      await assertSelection(target);
      const restoredTitle = await readTabTitle(target);
      expect(restoredTitle.text).assertEqual(titleBefore.text);
      assertRectClose(restoredTitle.rect, titleBefore.rect);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await assertUniqueId('background-list');
      await assertUniqueId('blur-tab-bar');
      await assertTabStructure(target);
      await assertTabStructure((target + 1) % 4);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABFROM2INTERIORRESUME_0020
    // @tc.name AdaptTabFrom2InteriorResume_0020
    // @tc.desc Verify tabUi {"initial":2,"viewport":"Interior","resume":true,"target":0,"hit":"Gutter","operation":"Reselect"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFrom2InteriorResume_0020', 0, async (): Promise<void> => {
      const scene: TabScene = { initial: 2, viewport: 'Interior', resume: true };
      await prepareTabScene(scene);
      const target: number = 0;
      const hitTarget: string = 'Gutter';
      const backgroundId = await visibleBackgroundId(scene.viewport);
      const backgroundBefore = await waitForStableBounds(backgroundId);
      const barBefore = await bounds('blur-tab-bar');
      const listBefore = await bounds('background-list');
      const itemBefore = await bounds('tab-item-' + target);
      const iconBefore = await bounds('tab-icon-' + target);
      const titleBefore = await readTabTitle(target);
      await assertTabStructure(target);
      await assertSelection(scene.initial);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      const titleAfter = await readTabTitle(target);
      expect(titleAfter.text).assertEqual(titleBefore.text);
      assertRectClose(titleAfter.rect, titleBefore.rect);
      assertRectClose(await bounds('tab-icon-' + target), iconBefore);
      assertRectClose(await bounds('tab-item-' + target), itemBefore);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      const repeatedTitle = await readTabTitle(target);
      expect(repeatedTitle.text).assertEqual(titleBefore.text);
      assertRectClose(repeatedTitle.rect, titleBefore.rect);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await restoreTabScene(scene);
      await assertSelection(target);
      const restoredTitle = await readTabTitle(target);
      expect(restoredTitle.text).assertEqual(titleBefore.text);
      assertRectClose(restoredTitle.rect, titleBefore.rect);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await assertUniqueId('background-list');
      await assertUniqueId('blur-tab-bar');
      await assertTabStructure(target);
      await assertTabStructure((target + 1) % 4);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABFROM2INTERIORRESUME_0021
    // @tc.name AdaptTabFrom2InteriorResume_0021
    // @tc.desc Verify tabUi {"initial":2,"viewport":"Interior","resume":true,"target":1,"hit":"Column","operation":"RoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFrom2InteriorResume_0021', 0, async (): Promise<void> => {
      const scene: TabScene = { initial: 2, viewport: 'Interior', resume: true };
      await prepareTabScene(scene);
      const target: number = 1;
      const hitTarget: string = 'Column';
      const backgroundId = await visibleBackgroundId(scene.viewport);
      const backgroundBefore = await waitForStableBounds(backgroundId);
      const barBefore = await bounds('blur-tab-bar');
      const listBefore = await bounds('background-list');
      const itemBefore = await bounds('tab-item-' + target);
      const iconBefore = await bounds('tab-icon-' + target);
      const titleBefore = await readTabTitle(target);
      await assertTabStructure(target);
      await assertSelection(scene.initial);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      const titleAfter = await readTabTitle(target);
      expect(titleAfter.text).assertEqual(titleBefore.text);
      assertRectClose(titleAfter.rect, titleBefore.rect);
      assertRectClose(await bounds('tab-icon-' + target), iconBefore);
      assertRectClose(await bounds('tab-item-' + target), itemBefore);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await activateTab(scene.initial, hitTarget);
      await assertSelection(scene.initial);
      assertRectClose(await bounds('tab-item-' + target), itemBefore);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      await restoreTabScene(scene);
      await assertSelection(target);
      const restoredTitle = await readTabTitle(target);
      expect(restoredTitle.text).assertEqual(titleBefore.text);
      assertRectClose(restoredTitle.rect, titleBefore.rect);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await assertUniqueId('background-list');
      await assertUniqueId('blur-tab-bar');
      await assertTabStructure(target);
      await assertTabStructure((target + 1) % 4);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABFROM2INTERIORRESUME_0022
    // @tc.name AdaptTabFrom2InteriorResume_0022
    // @tc.desc Verify tabUi {"initial":2,"viewport":"Interior","resume":true,"target":1,"hit":"Title","operation":"Select"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFrom2InteriorResume_0022', 0, async (): Promise<void> => {
      const scene: TabScene = { initial: 2, viewport: 'Interior', resume: true };
      await prepareTabScene(scene);
      const target: number = 1;
      const hitTarget: string = 'Title';
      const backgroundId = await visibleBackgroundId(scene.viewport);
      const backgroundBefore = await waitForStableBounds(backgroundId);
      const barBefore = await bounds('blur-tab-bar');
      const listBefore = await bounds('background-list');
      const itemBefore = await bounds('tab-item-' + target);
      const iconBefore = await bounds('tab-icon-' + target);
      const titleBefore = await readTabTitle(target);
      await assertTabStructure(target);
      await assertSelection(scene.initial);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      const titleAfter = await readTabTitle(target);
      expect(titleAfter.text).assertEqual(titleBefore.text);
      assertRectClose(titleAfter.rect, titleBefore.rect);
      assertRectClose(await bounds('tab-icon-' + target), iconBefore);
      assertRectClose(await bounds('tab-item-' + target), itemBefore);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await restoreTabScene(scene);
      await assertSelection(target);
      const restoredTitle = await readTabTitle(target);
      expect(restoredTitle.text).assertEqual(titleBefore.text);
      assertRectClose(restoredTitle.rect, titleBefore.rect);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await assertUniqueId('background-list');
      await assertUniqueId('blur-tab-bar');
      await assertTabStructure(target);
      await assertTabStructure((target + 1) % 4);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABFROM2INTERIORRESUME_0023
    // @tc.name AdaptTabFrom2InteriorResume_0023
    // @tc.desc Verify tabUi {"initial":2,"viewport":"Interior","resume":true,"target":1,"hit":"Icon","operation":"Reselect"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFrom2InteriorResume_0023', 0, async (): Promise<void> => {
      const scene: TabScene = { initial: 2, viewport: 'Interior', resume: true };
      await prepareTabScene(scene);
      const target: number = 1;
      const hitTarget: string = 'Icon';
      const backgroundId = await visibleBackgroundId(scene.viewport);
      const backgroundBefore = await waitForStableBounds(backgroundId);
      const barBefore = await bounds('blur-tab-bar');
      const listBefore = await bounds('background-list');
      const itemBefore = await bounds('tab-item-' + target);
      const iconBefore = await bounds('tab-icon-' + target);
      const titleBefore = await readTabTitle(target);
      await assertTabStructure(target);
      await assertSelection(scene.initial);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      const titleAfter = await readTabTitle(target);
      expect(titleAfter.text).assertEqual(titleBefore.text);
      assertRectClose(titleAfter.rect, titleBefore.rect);
      assertRectClose(await bounds('tab-icon-' + target), iconBefore);
      assertRectClose(await bounds('tab-item-' + target), itemBefore);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await activateTab(target, hitTarget);
      await assertSelection(target);
      const repeatedTitle = await readTabTitle(target);
      expect(repeatedTitle.text).assertEqual(titleBefore.text);
      assertRectClose(repeatedTitle.rect, titleBefore.rect);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await restoreTabScene(scene);
      await assertSelection(target);
      const restoredTitle = await readTabTitle(target);
      expect(restoredTitle.text).assertEqual(titleBefore.text);
      assertRectClose(restoredTitle.rect, titleBefore.rect);
      assertRectClose(await bounds('blur-tab-bar'), barBefore);
      assertRectClose(await bounds('background-list'), listBefore);
      assertRectClose(await bounds(backgroundId), backgroundBefore);
      await assertUniqueId('background-list');
      await assertUniqueId('blur-tab-bar');
      await assertTabStructure(target);
      await assertTabStructure((target + 1) % 4);
    });
  });
}
