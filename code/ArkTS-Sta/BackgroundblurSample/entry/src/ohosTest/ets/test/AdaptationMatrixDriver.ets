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

import { ON, Rect, MatchPattern } from '@ohos.UiTest';
import { expect } from '@ohos/hypium';
import { sameRect } from './InteractionAssertions';
import {
  TITLES, driver, requireId, resetPage, bounds, selectTab, assertSelection,
  scrollToLastImage, swipeBackground, backgroundAndRestore, findExactId,
  ObservedTitle, assertNodeText, assertRectClose, assertPositiveRect,
  assertUniqueId, waitForSelectedState, clickNodeCenter, simulateTouch,
  centerX, waitForStableBounds, swipeBackgroundTowardStart
} from './SharedDriver';

export interface TabScene {
  initial: number;
  viewport: string;
  resume: boolean;
}

interface InteriorAnchor {
  id: string;
  image: Rect;
  list: Rect;
}

let interiorAnchor: InteriorAnchor | undefined = undefined;

async function retainsInteriorViewport(): Promise<boolean> {
  const anchor = interiorAnchor;
  if (anchor === undefined) return false;
  const image = await driver().findComponent(ON.id(anchor.id));
  if (!image) return false;
  return sameRect(await image.getBounds(), anchor.image) &&
    sameRect(await bounds('background-list'), anchor.list);
}

export async function prepareTabScene(scene: TabScene): Promise<void> {
  const reuseInterior = scene.viewport === 'Interior' && await retainsInteriorViewport();
  let interiorFromEnd = false;
  if (scene.viewport === 'Interior' && !reuseInterior) {
    const last = await driver().findComponent(ON.id('background-image-9'));
    if (last) {
      const lastBounds = await last.getBounds();
      interiorFromEnd = lastBounds.bottom === (await bounds('background-list')).bottom;
    }
  }
  await resetPage(scene.viewport !== 'End' && !reuseInterior && !interiorFromEnd, scene.initial);
  if (scene.viewport === 'Interior' && !reuseInterior) {
    if (interiorFromEnd) await swipeBackgroundTowardStart();
    else await swipeBackground();
  } else if (scene.viewport === 'End') {
    await scrollToLastImage();
  } else if (scene.viewport !== 'Start' && scene.viewport !== 'Interior') {
    throw new Error('Unsupported viewport: ' + scene.viewport);
  }
  await assertSelection(scene.initial);
  await waitForStableBounds('blur-tab-bar');
  if (scene.viewport === 'Interior' && !reuseInterior) {
    const images = await driver().findComponents(ON.id('^background-image-[0-9]$', MatchPattern.REG_EXP));
    if (!images || images.length === 0) throw new Error('No background image in the interior viewport');
    const image = images[0];
    const id = await image.getId();
    const imageBounds = await waitForStableBounds(id);
    const list = await bounds('background-list');
    if (interiorFromEnd) {
      const first = await driver().findComponent(ON.id('background-image-0'));
      const last = await driver().findComponent(ON.id('background-image-9'));
      if (first && (await first.getBounds()).top === list.top ||
        last && (await last.getBounds()).bottom === list.bottom) {
        throw new Error('The background list did not enter an interior viewport');
      }
    }
    interiorAnchor = { id: id, image: imageBounds, list: list };
  }
}

export async function visibleBackgroundId(viewport: string): Promise<string> {
  if (viewport === 'Start') {
    return 'background-image-0';
  }
  if (viewport === 'End') {
    return 'background-image-9';
  }
  const list = await bounds('background-list');
  const bar = await bounds('blur-tab-bar');
  for (let index = 0; index < 10; index++) {
    const id = 'background-image-' + index;
    const component = await driver().findComponent(ON.id(id));
    if (component) {
      const rect = await component.getBounds();
      if (rect.top >= list.top && rect.bottom <= bar.top) {
        return id;
      }
    }
  }
  throw new Error('No complete background image in the interior viewport');
}

export async function activateTab(index: number, target: string): Promise<void> {
  if (target === 'Column') {
    await selectTab(index);
  } else if (target === 'Title') {
    await (await requireId('tab-title-' + index)).click();
  } else if (target === 'Icon') {
    await (await requireId('tab-icon-' + index)).click();
  } else if (target === 'Gutter') {
    const column = await bounds('tab-item-' + index);
    const icon = await bounds('tab-icon-' + index);
    const title = await bounds('tab-title-' + index);
    const x = Math.floor(column.left + 3);
    const y = Math.floor((icon.bottom + title.top) / 2);
    expect(x >= column.left && x < column.right).assertTrue();
    expect(y >= column.top && y < column.bottom).assertTrue();
    expect(y >= icon.bottom && y <= title.top).assertTrue();
    await simulateTouch(x, y);
  } else {
    throw new Error('Unsupported tab hit target: ' + target);
  }
  await waitForSelectedState('tab-item-' + index, true);
}

export async function readTabTitle(index: number): Promise<ObservedTitle> {
  const component = await findExactId('tab-title-' + index);
  const text = await component.getText();
  const rect = await component.getBounds();
  const enabled = await component.isEnabled();
  const observed: ObservedTitle = { text: text, rect: rect, enabled: enabled };
  assertNodeText(observed, TITLES[index]);
  return observed;
}

export async function assertTabStructure(index: number): Promise<void> {
  const item = await (await assertUniqueId('tab-item-' + index)).getBounds();
  const title = await (await assertUniqueId('tab-title-' + index)).getBounds();
  const icon = await (await assertUniqueId('tab-icon-' + index)).getBounds();
  assertPositiveRect(item);
  assertPositiveRect(title);
  assertPositiveRect(icon);
  expect(icon.bottom <= title.top + 1).assertTrue();
  expect(Math.abs(centerX(icon) - centerX(item)) <= 2).assertTrue();
  expect(Math.abs(centerX(title) - centerX(item)) <= 2).assertTrue();
}

export async function restoreTabScene(scene: TabScene): Promise<void> {
  if (scene.resume) {
    await backgroundAndRestore();
  }
}
