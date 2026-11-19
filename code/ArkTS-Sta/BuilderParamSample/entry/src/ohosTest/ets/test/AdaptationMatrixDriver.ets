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

import { expect } from '@ohos/hypium';
import { click, waitText, assertPositiveRect,
  assertContained, assertWidthRatio, assertVerticalAlignment, assertAbove,
  assertIdAbsent, clickNodeCenter } from './SharedDriver';
import { openHistory, slotCounts } from './HistoryDriver';
import { observeUiLayout, UiLayoutObservation } from './UiLayoutObservation';

export interface SlotScene {
  alignment: string;
  kind: string;
  tallLabel: boolean;
  tallDetail: boolean;
  narrow: boolean;
  label: boolean;
  detail: boolean;
  footer: boolean;
  extraFooter: boolean;
}

export function detailId(kind: string): string {
  if (kind === 'Text') return 'slots-detail-text';
  if (kind === 'Button') return 'slots-detail-button';
  if (kind === 'Nested') return 'slots-inner-container';
  throw new Error('Unsupported detail kind: ' + kind);
}

export async function prepareSlotScene(scene: SlotScene): Promise<void> {
  await openHistory('slots');
  if (scene.kind === 'Button') await click('slots-use-button');
  if (scene.kind === 'Nested') await click('slots-use-nested');
  if (scene.tallLabel) await click('slots-grow-label');
  if (scene.tallDetail) await click('slots-grow-detail');
  if (scene.narrow) await click('slots-toggle-width');
  if (scene.alignment !== 'Center') await click('slots-align');
  if (scene.alignment === 'Bottom') await click('slots-align');
  if (!scene.label) await click('slots-toggle-label');
  if (!scene.detail) await click('slots-toggle-detail');
  if (!scene.footer) await click('slots-toggle-bottom');
  if (scene.extraFooter) await click('slots-toggle-extra');
  await waitText('slots-alignment', scene.alignment);
  await slotCounts(0, 0, 0, 0);
}

export async function assertSlotPresence(scene: SlotScene, observation?: UiLayoutObservation): Promise<void> {
  const observed = observation || await observeUiLayout();
  expect(observed.exists('slots-label')).assertEqual(scene.label);
  expect(observed.exists(detailId(scene.kind))).assertEqual(scene.detail);
  expect(observed.exists('slots-bottom')).assertEqual(scene.footer);
  expect(observed.exists('slots-bottom-extra')).assertEqual(scene.footer && scene.extraFooter);
  if (scene.kind !== 'Text') {
    expect(observed.exists('slots-detail-text')).assertFalse();
  }
  if (scene.kind !== 'Button') {
    expect(observed.exists('slots-detail-button')).assertFalse();
  }
  if (scene.kind !== 'Nested') {
    expect(observed.exists('slots-inner-container')).assertFalse();
  }
}

export async function assertEmptySlotLayout(scene: SlotScene, observation?: UiLayoutObservation): Promise<void> {
  expect(scene.label).assertFalse();
  expect(scene.detail).assertFalse();
  expect(scene.footer).assertFalse();
  await assertSlotPresence(scene, observation);
  await assertIdAbsent('slots-card-container');
  const observed = observation || await observeUiLayout();
  const row = observed.bounds('slots-card-row');
  const surface = observed.bounds('slots-surface');
  const counts = observed.bounds('slots-counts');
  assertPositiveRect(row);
  assertPositiveRect(surface);
  assertContained(row, surface);
  assertWidthRatio(row, surface, scene.narrow ? 0.64 : 1);
  expect(row.bottom - row.top <= 2).assertTrue();
  expect(Math.abs(row.bottom - counts.bottom) <= 2).assertTrue();
  expect(Math.abs(surface.bottom - counts.bottom) <= 2).assertTrue();
}

export async function assertSlotLayout(scene: SlotScene, observation?: UiLayoutObservation): Promise<void> {
  const observed = observation || await observeUiLayout();
  const container = observed.bounds('slots-card-container');
  const row = observed.bounds('slots-card-row');
  const surface = observed.bounds('slots-surface');
  assertPositiveRect(container);
  assertPositiveRect(row);
  assertContained(row, container);
  assertWidthRatio(container, surface, scene.narrow ? 0.64 : 1);
  if (scene.label && scene.detail) {
    const label = observed.bounds('slots-label');
    const detail = observed.bounds(detailId(scene.kind));
    assertVerticalAlignment(label, detail, scene.alignment);
    expect(label.right <= detail.left + 2).assertTrue();
  }
  if (scene.footer) {
    const footer = observed.bounds('slots-bottom');
    assertPositiveRect(footer);
    assertAbove(row, footer);
    if (scene.extraFooter) {
      const extra = observed.bounds('slots-bottom-extra');
      assertAbove(footer, extra);
      expect(observed.text('slots-bottom-extra')).assertEqual('Second footer root');
    }
  } else {
    expect(Math.abs(container.bottom - row.bottom) <= 2).assertTrue();
  }
}

export async function activateSlot(id: string, coordinates: boolean): Promise<void> {
  if (coordinates) {
    await clickNodeCenter(id);
  } else {
    await click(id);
  }
}

export async function assertSlotTexts(scene: SlotScene, observation?: UiLayoutObservation): Promise<void> {
  const observed = observation || await observeUiLayout();
  if (scene.label) {
    expect(observed.text('slots-label')).assertEqual('Label');
    expect(observed.count('slots-label')).assertEqual(1);
  }
  if (scene.detail && scene.kind === 'Text') {
    expect(observed.text('slots-detail-text')).assertEqual('Detail text');
  }
  if (scene.detail && scene.kind === 'Button') {
    expect(observed.text('slots-detail-button')).assertEqual('Detail action');
  }
  if (scene.detail && scene.kind === 'Nested') {
    expect(observed.text('slots-inner-detail')).assertEqual('Inner detail');
    expect(observed.text('slots-inner-bottom')).assertEqual('Inner footer');
    expect(observed.count('slots-inner-label')).assertEqual(1);
  }
  if (scene.footer) {
    expect(observed.text('slots-bottom')).assertEqual('Footer action');
    expect(observed.count('slots-bottom')).assertEqual(1);
  }
}

// Presence, text and geometry describe the same read-only scene. Capturing once
// keeps these assertions consistent without repeating device tree traversals.
export async function assertSlotScene(scene: SlotScene, empty: boolean = false): Promise<void> {
  const observed = await observeUiLayout();
  await assertSlotPresence(scene, observed);
  await assertSlotTexts(scene, observed);
  if (empty) {
    await assertEmptySlotLayout(scene, observed);
  } else {
    await assertSlotLayout(scene, observed);
  }
}
