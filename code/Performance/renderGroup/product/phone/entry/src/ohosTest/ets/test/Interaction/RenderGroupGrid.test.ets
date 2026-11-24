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
import {
  SCENES, SWITCH_ID, assertSwitch, assertVisibleItem, backToHome, countText, openScene, readGridLabelIndices, toggleTo,
  visibleBounds, waitId, waitText, withScene
} from '../Shared/SharedDriver';

export default function renderGroupGridTest(): void {
  describe('RenderGroupGrid', () => {
    for (const scene of SCENES) {
      it(`${scene.name}DisplaysFirstResourceCycle`, 0, async () => {
        await withScene(scene, async () => {
          await assertVisibleItem(1);
          await assertVisibleItem(2);
          await assertVisibleItem(3);
          await assertVisibleItem(4);
          await assertVisibleItem(5);
          await assertVisibleItem(6);
        });
      });

      it(`${scene.name}FirstItemsAreInAscendingColumnOrder`, 0, async () => {
        await withScene(scene, async () => {
          const first = await waitText('item1');
          const second = await waitText('item2');
          const third = await waitText('item3');
          const firstBounds = await first.getBounds();
          const secondBounds = await second.getBounds();
          const thirdBounds = await third.getBounds();
          expect(firstBounds.left < secondBounds.left).assertTrue();
          expect(secondBounds.left < thirdBounds.left).assertTrue();
          expect(firstBounds.right <= secondBounds.left).assertTrue();
          expect(secondBounds.right <= thirdBounds.left).assertTrue();
          const lastBounds = await visibleBounds(await waitText('item6'));
          expect(lastBounds.left > thirdBounds.right).assertTrue();
        });
      });

      it(`${scene.name}ContinuesItemLabelsOnSecondRow`, 0, async () => {
        await withScene(scene, async () => {
          const first = await waitText('item1');
          const nextRow = await waitText('item7');
          const firstBounds = await first.getBounds();
          const nextBounds = await nextRow.getBounds();
          const lastBounds = await visibleBounds(await waitText('item6'));
          expect(nextBounds.top > firstBounds.top).assertTrue();
          expect(nextBounds.top > lastBounds.top).assertTrue();
          await assertVisibleItem(7);
        });
      });

      it(`${scene.name}DoesNotRenderZeroBasedItem`, 0, async () => {
        await withScene(scene, async () => {
          await assertVisibleItem(1);
          expect(await countText('item0')).assertEqual(0);
        });
      });

      it(`${scene.name}TogglePreservesFirstRowContent`, 0, async () => {
        await withScene(scene, async () => {
          await toggleTo(true);
          await assertVisibleItem(1);
          await assertVisibleItem(3);
          await toggleTo(false);
          await assertVisibleItem(1);
          await assertVisibleItem(3);
        });
      });

      it(`${scene.name}RecreationDoesNotDuplicateVisibleLabels`, 0, async () => {
        await withScene(scene, async () => {
          await assertVisibleItem(1);
          await backToHome();
          expect(await countText('item1')).assertEqual(0);
          await openScene(scene);
          await assertSwitch(false);
          await assertVisibleItem(1);
          await assertVisibleItem(7);
        });
      });

      it(`${scene.name}ExposedGridLabelsStayUniqueAndInRangeAcrossToggle`, 0, async () => {
        await withScene(scene, async () => {
          await assertSwitch(false);
          const before = await readGridLabelIndices();
          expect(before.slice(0, 6).join(',')).assertEqual('1,2,3,4,5,6');
          await toggleTo(true);
          const after = await readGridLabelIndices();
          expect(after.slice(0, 6).join(',')).assertEqual('1,2,3,4,5,6');
        });
      });

      it(`${scene.name}ReturningHomeRemovesAllExposedGridLabels`, 0, async () => {
        await withScene(scene, async () => {
          await assertVisibleItem(1);
          await toggleTo(true);
          await backToHome();
          const remaining = await readGridLabelIndices();
          expect(remaining.length).assertEqual(0);
        });
      });

      it(`${scene.name}SwitchAndGridRemainSeparatedAfterToggle`, 0, async () => {
        await withScene(scene, async () => {
          for (const enabled of [false, true]) {
            if (enabled) {
              await toggleTo(true);
            }
            const button = await visibleBounds(await waitId(SWITCH_ID));
            const first = await visibleBounds(await waitText('item1'));
            const last = await visibleBounds(await waitText('item6'));
            expect(first.top >= button.bottom).assertTrue();
            expect(last.top >= button.bottom).assertTrue();
            await assertSwitch(enabled);
          }
        });
      });
    }
  });
}
