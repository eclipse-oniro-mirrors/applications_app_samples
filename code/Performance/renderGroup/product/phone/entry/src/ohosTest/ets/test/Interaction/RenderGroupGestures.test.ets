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

import { describe, expect, it } from '@ohos/hypium';
import {
  SCENES, Scene, assertEntryForeground, assertScene, assertSwitch, assertVisibleItem, getDriver,
  toggleTo, visibleBounds, waitText, withScene
} from '../Shared/SharedDriver';

class ItemPoint {
  public x: number;
  public y: number;

  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
}

async function gridPoint(index: number): Promise<ItemPoint> {
  const bounds = await visibleBounds(await waitText(`item${index}`));
  const display = await getDriver().getDisplaySize();
  const x = Math.floor((bounds.left + bounds.right) / 2);
  const y = Math.floor((bounds.top + bounds.bottom) / 2);
  expect(x >= 0 && x < display.x && y >= 0 && y < display.y).assertTrue();
  return new ItemPoint(x, y);
}

async function assertContentResponsive(scene: Scene, enabled: boolean): Promise<void> {
  await assertEntryForeground();
  await assertScene(scene);
  await assertSwitch(enabled);
  await assertVisibleItem(1);
  await assertVisibleItem(7);
  await toggleTo(!enabled);
  await assertScene(scene);
  await assertVisibleItem(1);
}

export default function renderGroupGesturesTest(): void {
  describe('RenderGroupGestures', () => {
    for (const scene of SCENES) {
      for (const enabled of [false, true]) {
        const state = enabled ? 'Enabled' : 'Disabled';
        it(`${scene.name}GridLongPressPreserves${state}State`, 0, async () => {
          await withScene(scene, async () => {
            if (enabled) {
              await toggleTo(true);
            }
            await assertSwitch(enabled);
            const point = await gridPoint(1);
            await getDriver().longClick(point.x, point.y);
            await assertContentResponsive(scene, enabled);
          });
        });

        it(`${scene.name}GridDoubleTapPreserves${state}State`, 0, async () => {
          await withScene(scene, async () => {
            if (enabled) {
              await toggleTo(true);
            }
            await assertSwitch(enabled);
            const item = await waitText('item3');
            await visibleBounds(item);
            await item.doubleClick();
            await assertContentResponsive(scene, enabled);
          });
        });

        it(`${scene.name}GridHorizontalSwipePreserves${state}State`, 0, async () => {
          await withScene(scene, async () => {
            if (enabled) {
              await toggleTo(true);
            }
            await assertSwitch(enabled);
            const start = await gridPoint(2);
            const end = await gridPoint(5);
            expect(end.x > start.x).assertTrue();
            await getDriver().swipe(start.x, start.y, end.x, start.y);
            await assertContentResponsive(scene, enabled);
          });
        });

        it(`${scene.name}GridVerticalSwipePreserves${state}State`, 0, async () => {
          await withScene(scene, async () => {
            if (enabled) {
              await toggleTo(true);
            }
            await assertSwitch(enabled);
            const start = await gridPoint(8);
            const end = await gridPoint(2);
            expect(start.y > end.y).assertTrue();
            await getDriver().swipe(start.x, start.y, start.x, end.y);
            await assertContentResponsive(scene, enabled);
          });
        });
      }
    }
  });
}
