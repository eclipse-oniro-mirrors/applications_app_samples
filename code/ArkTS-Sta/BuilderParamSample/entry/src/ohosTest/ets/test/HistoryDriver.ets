/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */
import { expect } from '@ohos/hypium';
import { Rect } from '@ohos.UiTest';
import { bounds, click, driver, exists, startAbility, text, waitText,
  assertPositiveRect, simulateTouch, centerX, centerY } from './SharedDriver';
import { observeUiLayout, UiLayoutObservation } from './UiLayoutObservation';

export async function openHistory(section: string): Promise<void> {
  if (!await exists('fixture-heading')) {
    await startAbility('FixtureAbility');
    await waitText('fixture-heading', 'BuilderParam fixture');
  }
  await click('mode-history');
  await waitText('fixture-mode', 'history');
  // Unmount the previous controller so tests never inherit its local state.
  await click('history-reset');
  await waitText('history-section', 'none');
  await click('history-' + section);
  await waitText('history-section', section);
  if (section === 'slots') {
    await waitText('slots-detail-text', 'Detail text');
    await waitText('slots-counts', 'Label 0; footer 0; detail 0; inner 0');
  } else if (section === 'owners') {
    await waitText('owners-primary-caption', 'Primary owner');
    await waitText('owners-primary-counts', 'Label 0; footer 0');
    await waitText('owners-sibling-counts', 'Label 0; footer 0');
  } else if (section === 'props') {
    await waitText('props-primary-title', 'Primary title');
    await waitText('props-primary-description', 'Primary description');
  } else {
    throw new Error('Unknown history section: ' + section);
  }
}

export async function slotCounts(label: number, footer: number, detail: number, inner: number): Promise<void> {
  await waitText('slots-counts',
    'Label ' + label + '; footer ' + footer + '; detail ' + detail + '; inner ' + inner);
}

export async function ownerState(prefix: string, labels: number, footers: number, event: string): Promise<void> {
  await ownerStates([{ prefix: prefix, labels: labels, footers: footers, event: event }]);
}

export interface OwnerExpectation {
  prefix: string;
  labels: number;
  footers: number;
  event: string;
}

// Adjacent owner checks observe the same live tree after each UI action.
// Polling retains the original wait for the counters to reach their values.
export async function ownerStates(states: OwnerExpectation[],
  observation?: UiLayoutObservation): Promise<UiLayoutObservation> {
  const deadline = Date.now() + 8000;
  while (Date.now() < deadline) {
    const observed = observation || await observeUiLayout();
    let ready: boolean = true;
    for (const state of states) {
      const expected = 'Label ' + state.labels + '; footer ' + state.footers;
      if (!observed.exists(state.prefix + '-counts') ||
        observed.text(state.prefix + '-counts') !== expected) {
        ready = false;
      }
    }
    if (ready) {
      for (const state of states) {
        expect(observed.text(state.prefix + '-counts'))
          .assertEqual('Label ' + state.labels + '; footer ' + state.footers);
        expect(observed.text(state.prefix + '-event')).assertEqual(state.event);
      }
      return observed;
    }
    observation = undefined;
    await driver().delayMs(100);
  }
  throw new Error('Expected owner counters not ready');
}

// Only use an observation taken after the preceding UI action. The next action
// invalidates it; callers obtain a new one before any further coordinate click.
export async function activateObservedOwner(id: string, coordinates: boolean,
  observed: UiLayoutObservation): Promise<void> {
  if (coordinates) {
    expect(observed.count(id)).assertEqual(1);
    const rect = observed.bounds(id);
    assertPositiveRect(rect);
    await simulateTouch(centerX(rect), centerY(rect));
  } else {
    await click(id);
  }
}

export function sameRect(actual: Rect, expected: Rect): void {
  expect(Math.abs(actual.left - expected.left) <= 2).assertTrue();
  expect(Math.abs(actual.top - expected.top) <= 2).assertTrue();
  expect(Math.abs(actual.right - expected.right) <= 2).assertTrue();
  expect(Math.abs(actual.bottom - expected.bottom) <= 2).assertTrue();
}

export async function siblingPropsUnchanged(): Promise<void> {
  expect(await text('props-sibling-title')).assertEqual('Sibling title');
  expect(await text('props-sibling-description')).assertEqual('Sibling description');
}

export async function bottomFollowsRow(): Promise<void> {
  const row = await bounds('slots-card-row');
  expect((await bounds('slots-bottom')).top >= row.bottom - 1).assertTrue();
}
