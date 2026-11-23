/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */
import { Driver, ON, Component, Rect } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { expect } from '@ohos/hypium';

export const TITLES: string[] = ['\u51fa\u884c\u524d\u7b2c7\u5929', '\u51fa\u884c\u524d\u7b2c6\u5929', '\u51fa\u884c\u524d\u7b2c5\u5929'];
export const DESCRIPTIONS: string[] = [
  '\u786e\u5b9a\u65c5\u884c\u76ee\u7684\u5730,\u51fa\u884c\u65b9\u5f0f(\u81ea\u5bb6/\u9ad8\u94c1/\u98de\u673a)',
  '\u9884\u5b9a\u5f80\u8fd4\u4ea4\u901a\u7968,\u76ee\u7684\u5730\u4f4f\u5bbf.\u9884\u7ea6\u70ed\u95e8\u7ecf\u5178\u95e8\u7968,\u89c4\u5212\u884c\u7a0b\u8def\u7ebf',
  '\u68c0\u67e5\u5404\u79cd\u8bc1\u4ef6,\u5145\u7535\u5b9d\u7b49\u5fc5\u5907\u7269\u54c1.\u5217\u51fa\u7269\u8d44\u6e05\u5355(\u8863\u7269,\u6d17\u6f31\u7528\u54c1,\u5e38\u7528\u836f\u7269)'
];
let instance: Driver | undefined = undefined;
export function driver(): Driver {
  if (!instance) {
    instance = Driver.create();
  }
  return instance;
}
export function cardId(index: number, suffix: string): string {
  return 'trip-' + TITLES[index] + '-' + suffix;
}
export async function node(id: string): Promise<Component> {
  const value = await driver().findComponent(ON.id(id));
  if (!value) {
    throw new Error('Missing UI node: ' + id);
  }
  return value;
}
export async function text(id: string): Promise<string> {
  return (await node(id)).getText();
}
export async function bounds(id: string): Promise<Rect> {
  return (await node(id)).getBounds();
}
export async function click(id: string): Promise<void> {
  await (await node(id)).click();
}
export async function exists(id: string): Promise<boolean> {
  return !!(await driver().findComponent(ON.id(id)));
}
export async function waitText(id: string, value: string): Promise<void> {
  const deadline = Date.now() + 8000;
  while (Date.now() < deadline) {
    // Match both attributes in one live query; a separate getText round trip
    // on every wait pushed the longer UI scenarios over Hypium's 15s limit.
    const component = await driver().findComponent(ON.id(id).text(value));
    if (component) {
      return;
    }
    await driver().delayMs(100);
  }
  throw new Error('Expected UI text not ready: ' + id);
}
export async function waitClearedText(id: string): Promise<void> {
  const deadline = Date.now() + 4000;
  while (Date.now() < deadline) {
    const component = await driver().findComponent(ON.id(id));
    // Empty Text may have zero bounds and be omitted from the UiTest tree.
    if (!component || await component.getText() === '') {
      return;
    }
    await driver().delayMs(100);
  }
  throw new Error('Previous UI text was not cleared: ' + id);
}
export async function startAbility(abilityName: string): Promise<void> {
  await abilityDelegatorRegistry.getAbilityDelegator().startAbility({
    bundleName: abilityDelegatorRegistry.getArguments().bundleName, abilityName: abilityName
  });
}
export async function openMain(): Promise<void> {
  if (!await exists('trip-heading')) {
    await startAbility('EntryAbility');
  }
  await waitText(cardId(2, 'title'), TITLES[2]);
}
export async function openFixture(mode: string): Promise<void> {
  if (!await exists('fixture-heading')) {
    await startAbility('FixtureAbility');
    await waitText('fixture-heading', 'BuilderParam fixture');
  }
  await click('mode-' + mode);
  await waitText('fixture-mode', mode);
  await waitText('label-clicks', 'Label clicks: 0');
}
export async function verifyMainContent(): Promise<void> {
  expect(await text('trip-heading')).assertEqual('\u884c\u7a0b\u89c4\u5212');
  for (let index = 0; index < TITLES.length; index++) {
    expect(await text(cardId(index, 'title'))).assertEqual(TITLES[index]);
    expect(await text(cardId(index, 'description'))).assertEqual(DESCRIPTIONS[index]);
  }
}
export function positive(rect: Rect): void {
  expect(rect.right > rect.left).assertTrue();
  expect(rect.bottom > rect.top).assertTrue();
}
export function inside(inner: Rect, outer: Rect): void {
  expect(inner.left >= outer.left - 1).assertTrue();
  expect(inner.right <= outer.right + 1).assertTrue();
  expect(inner.top >= outer.top - 1).assertTrue();
  expect(inner.bottom <= outer.bottom + 1).assertTrue();
}
export interface AbilitySnapshot {
  recordId: string;
  state: string;
}
export async function abilitySnapshot(abilityName: string): Promise<AbilitySnapshot> {
  const result = await abilityDelegatorRegistry.getAbilityDelegator().executeShellCommand('aa dump -a', 2);
  expect(result.exitCode).assertEqual(0);
  const records = result.stdResult.split('AbilityRecord ID #');
  for (const record of records) {
    if (record.includes('main name [' + abilityName + ']') &&
      record.includes('bundle name [com.example.builderparamsample]')) {
      const state = record.split('\n').map(line => line.trim()).find(line => line.startsWith('state #'));
      if (state) {
        return { recordId: record.split('\n')[0].trim(), state: state.split('#')[1].split(' ')[0] };
      }
    }
  }
  throw new Error('Ability record is missing: ' + abilityName);
}
async function waitState(abilityName: string, expected: string): Promise<AbilitySnapshot> {
  const deadline = Date.now() + 4000;
  while (Date.now() < deadline) {
    const snapshot = await abilitySnapshot(abilityName);
    if (snapshot.state === expected) {
      return snapshot;
    }
    await driver().delayMs(50);
  }
  throw new Error('Ability state did not become ' + expected);
}
export async function backgroundAndRestore(abilityName: string, readyId: string, readyText: string): Promise<void> {
  const before = await waitState(abilityName, 'FOREGROUND');
  await driver().pressHome();
  const background = await waitState(abilityName, 'BACKGROUND');
  expect(background.recordId).assertEqual(before.recordId);
  expect(await exists(readyId)).assertFalse();
  await startAbility(abilityName);
  await waitText(readyId, readyText);
  const restored = await waitState(abilityName, 'FOREGROUND');
  expect(restored.recordId).assertEqual(before.recordId);
}

// ADAPTATION_SHARED_BEGIN
// These helpers preserve the reference driver's strict, serialized UI boundary.
export interface ObservedNode {
  id: string;
  text: string;
  rect: Rect;
  enabled: boolean;
  clickable: boolean;
  selected: boolean;
}

export interface ObservedSize {
  width: number;
  height: number;
}

let adaptationQueue: Promise<void> = Promise.resolve();

export async function runSerializedUiOperation<T>(action: () => Promise<T>): Promise<T> {
  const operation: Promise<T> = adaptationQueue.then(action);
  adaptationQueue = operation.then((): void => {}, (): void => {});
  return operation;
}

export async function serializedDelay(milliseconds: number): Promise<void> {
  if (milliseconds < 0 || milliseconds > 10000) {
    throw new Error('Invalid UI delay: ' + milliseconds);
  }
  await runSerializedUiOperation(async (): Promise<void> => {
    await driver().delayMs(milliseconds);
  });
}

export async function triggerSerializedKey(key: number): Promise<void> {
  if (!Number.isInteger(key) || key < 0) {
    throw new Error('Invalid key code: ' + key);
  }
  await runSerializedUiOperation(async (): Promise<void> => {
    await driver().triggerKey(key);
  });
}

export async function findComponentsByType(type: string): Promise<Component[]> {
  return runSerializedUiOperation(async (): Promise<Component[]> => {
    const found = await driver().findComponents(ON.type(type));
    return found ? found : [];
  });
}

export async function findExactId(id: string): Promise<Component> {
  return runSerializedUiOperation(async (): Promise<Component> => {
    const found = await driver().findComponents(ON.id(id));
    if (!found || found.length !== 1) {
      throw new Error('Expected exactly one component: ' + id);
    }
    return found[0];
  });
}

export async function readObservedNode(id: string): Promise<ObservedNode> {
  const component = await findExactId(id);
  const textValue = await component.getText();
  const rectangle = await component.getBounds();
  const enabledValue = await component.isEnabled();
  const clickableValue = await component.isClickable();
  const selectedValue = await component.isSelected();
  const result: ObservedNode = {
    id: id,
    text: textValue,
    rect: rectangle,
    enabled: enabledValue,
    clickable: clickableValue,
    selected: selectedValue
  };
  return result;
}

export async function checkComponentExists(id: string): Promise<boolean> {
  return runSerializedUiOperation(async (): Promise<boolean> => {
    const component = await driver().findComponent(ON.id(id));
    return component !== null && component !== undefined;
  });
}

export async function checkTextContent(id: string, expectedText: string): Promise<boolean> {
  const component = await findExactId(id);
  const actualText = await component.getText();
  return actualText === expectedText;
}

export async function waitForIdState(id: string, present: boolean): Promise<void> {
  const deadline = Date.now() + 2500;
  while (Date.now() < deadline) {
    const actual = await checkComponentExists(id);
    if (actual === present) {
      return;
    }
    await serializedDelay(50);
  }
  throw new Error('Component presence did not settle: ' + id + ' expected ' + present);
}

export async function waitForExactText(id: string, expectedText: string): Promise<void> {
  const deadline = Date.now() + 2500;
  while (Date.now() < deadline) {
    const component = await driver().findComponent(ON.id(id).text(expectedText));
    if (component) {
      return;
    }
    await serializedDelay(50);
  }
  throw new Error('Text did not settle: ' + id);
}

export async function waitForSelectedState(id: string, selected: boolean): Promise<void> {
  const deadline = Date.now() + 2500;
  while (Date.now() < deadline) {
    const component = await findExactId(id);
    const actual = await component.isSelected();
    if (actual === selected) {
      return;
    }
    await serializedDelay(50);
  }
  throw new Error('Selection did not settle: ' + id);
}

export function observedSize(rect: Rect): ObservedSize {
  return {
    width: rect.right - rect.left,
    height: rect.bottom - rect.top
  };
}

export function centerX(rect: Rect): number {
  return Math.floor((rect.left + rect.right) / 2);
}

export function centerY(rect: Rect): number {
  return Math.floor((rect.top + rect.bottom) / 2);
}

export function assertPositiveRect(rect: Rect): void {
  const size = observedSize(rect);
  expect(size.width > 0).assertTrue();
  expect(size.height > 0).assertTrue();
}

export function assertRectClose(actual: Rect, expected: Rect, tolerance: number = 2): void {
  expect(Math.abs(actual.left - expected.left) <= tolerance).assertTrue();
  expect(Math.abs(actual.top - expected.top) <= tolerance).assertTrue();
  expect(Math.abs(actual.right - expected.right) <= tolerance).assertTrue();
  expect(Math.abs(actual.bottom - expected.bottom) <= tolerance).assertTrue();
}

export function assertSizeClose(actual: Rect, expected: Rect, tolerance: number = 2): void {
  const actualSize = observedSize(actual);
  const expectedSize = observedSize(expected);
  expect(Math.abs(actualSize.width - expectedSize.width) <= tolerance).assertTrue();
  expect(Math.abs(actualSize.height - expectedSize.height) <= tolerance).assertTrue();
}

export function assertContained(inner: Rect, outer: Rect, tolerance: number = 2): void {
  expect(inner.left >= outer.left - tolerance).assertTrue();
  expect(inner.right <= outer.right + tolerance).assertTrue();
  expect(inner.top >= outer.top - tolerance).assertTrue();
  expect(inner.bottom <= outer.bottom + tolerance).assertTrue();
}

export function assertLeftOf(left: Rect, right: Rect, tolerance: number = 2): void {
  expect(left.right <= right.left + tolerance).assertTrue();
}

export function assertAbove(upper: Rect, lower: Rect, tolerance: number = 2): void {
  expect(upper.bottom <= lower.top + tolerance).assertTrue();
}

export function assertVerticalAlignment(first: Rect, second: Rect, alignment: string): void {
  if (alignment === 'Top') {
    expect(Math.abs(first.top - second.top) <= 2).assertTrue();
  } else if (alignment === 'Bottom') {
    expect(Math.abs(first.bottom - second.bottom) <= 2).assertTrue();
  } else if (alignment === 'Center') {
    const firstCenter = (first.top + first.bottom) / 2;
    const secondCenter = (second.top + second.bottom) / 2;
    expect(Math.abs(firstCenter - secondCenter) <= 2).assertTrue();
  } else {
    throw new Error('Unsupported alignment: ' + alignment);
  }
}

export function assertWidthRatio(inner: Rect, outer: Rect, ratio: number): void {
  const actualWidth = inner.right - inner.left;
  const expectedWidth = (outer.right - outer.left) * ratio;
  expect(Math.abs(actualWidth - expectedWidth) <= 3).assertTrue();
}

export function assertNodeText(node: ObservedNode, expected: string): void {
  expect(node.text).assertEqual(expected);
  expect(node.enabled).assertTrue();
  assertPositiveRect(node.rect);
}

export function assertNodeUnchanged(actual: ObservedNode, expected: ObservedNode): void {
  expect(actual.id).assertEqual(expected.id);
  expect(actual.text).assertEqual(expected.text);
  expect(actual.enabled).assertEqual(expected.enabled);
  expect(actual.clickable).assertEqual(expected.clickable);
  expect(actual.selected).assertEqual(expected.selected);
  assertRectClose(actual.rect, expected.rect);
}

export async function assertUniqueId(id: string): Promise<void> {
  const matches = await driver().findComponents(ON.id(id));
  const count = matches ? matches.length : 0;
  expect(count).assertEqual(1);
}

export async function assertIdAbsent(id: string): Promise<void> {
  const present = await checkComponentExists(id);
  expect(present).assertFalse();
}

export async function clickExactId(id: string): Promise<void> {
  const component = await findExactId(id);
  await runSerializedUiOperation(async (): Promise<void> => {
    await component.click();
  });
}

export async function simulateTouch(x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    await driver().click(x, y);
  });
}

export async function clickNodeCenter(id: string): Promise<void> {
  const component = await findExactId(id);
  const rect = await component.getBounds();
  assertPositiveRect(rect);
  await simulateTouch(centerX(rect), centerY(rect));
}

export async function longClickExactId(id: string): Promise<void> {
  const component = await findExactId(id);
  await runSerializedUiOperation(async (): Promise<void> => {
    await component.longClick();
  });
}

export async function readNodeSequence(ids: string[]): Promise<ObservedNode[]> {
  const result: ObservedNode[] = [];
  for (const id of ids) {
    result.push(await readObservedNode(id));
  }
  return result;
}

export async function assertSequenceUnchanged(expected: ObservedNode[]): Promise<void> {
  for (const original of expected) {
    const actual = await readObservedNode(original.id);
    assertNodeUnchanged(actual, original);
  }
}

export async function waitForStableBounds(id: string): Promise<Rect> {
  const deadline = Date.now() + 1800;
  let previous = await (await findExactId(id)).getBounds();
  let matchingSamples: number = 0;
  while (Date.now() < deadline) {
    await serializedDelay(60);
    const current = await (await findExactId(id)).getBounds();
    const equal = current.left === previous.left && current.top === previous.top &&
      current.right === previous.right && current.bottom === previous.bottom;
    matchingSamples = equal ? matchingSamples + 1 : 0;
    if (matchingSamples >= 2) {
      assertPositiveRect(current);
      return current;
    }
    previous = current;
  }
  throw new Error('Bounds did not settle: ' + id);
}

export async function waitForOriginalBounds(id: string, expected: Rect): Promise<void> {
  const deadline = Date.now() + 2500;
  while (Date.now() < deadline) {
    const component = await findExactId(id);
    const current = await component.getBounds();
    const matches = Math.abs(current.left - expected.left) <= 2 &&
      Math.abs(current.top - expected.top) <= 2 &&
      Math.abs(current.right - expected.right) <= 2 &&
      Math.abs(current.bottom - expected.bottom) <= 2;
    if (matches) {
      return;
    }
    await serializedDelay(50);
  }
  throw new Error('Original bounds were not restored: ' + id);
}

export async function assertTextSequence(ids: string[], expected: string[]): Promise<void> {
  expect(ids.length).assertEqual(expected.length);
  for (let index = 0; index < ids.length; index++) {
    const component = await findExactId(ids[index]);
    const actualText = await component.getText();
    expect(actualText).assertEqual(expected[index]);
  }
}

export async function assertOnlySelected(ids: string[], selectedIndex: number): Promise<void> {
  let selectedCount: number = 0;
  for (let index = 0; index < ids.length; index++) {
    const component = await findExactId(ids[index]);
    const selected = await component.isSelected();
    expect(selected).assertEqual(index === selectedIndex);
    if (selected) {
      selectedCount++;
    }
  }
  expect(selectedCount).assertEqual(1);
}

export async function assertClickable(id: string, expected: boolean): Promise<void> {
  const component = await findExactId(id);
  const enabled = await component.isEnabled();
  const clickable = await component.isClickable();
  expect(enabled).assertTrue();
  expect(clickable).assertEqual(expected);
}
// ADAPTATION_SHARED_END
