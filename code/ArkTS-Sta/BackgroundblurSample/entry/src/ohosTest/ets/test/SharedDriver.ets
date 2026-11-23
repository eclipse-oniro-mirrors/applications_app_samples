/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */
import { Component, Driver, ON, Rect } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { expect } from '@ohos/hypium';
import { UIContext } from '@ohos.arkui.UIContext';
import { BusinessError } from '@ohos.base';

let instance: Driver | undefined = undefined;
let initialFirstImage: Rect | undefined = undefined;
let selectionItems: Component[] = [];
export const TITLES: string[] = ['\u80cc\u666f\u6a21\u7cca', '\u7011\u5e03\u6d41',
  '\u6298\u53e0\u9762\u677f', '\u6211\u7684'];
export function driver(): Driver {
  if (instance === undefined) instance = Driver.create();
  return instance;
}

export async function requireId(id: string): Promise<Component> {
  const item = await driver().findComponent(ON.id(id));
  if (!item) throw new Error('Missing component: ' + id);
  return item;
}

export async function launchSample(): Promise<void> {
  selectionItems = [];
  await abilityDelegatorRegistry.getAbilityDelegator().startAbility({
    bundleName: abilityDelegatorRegistry.getArguments().bundleName,
    abilityName: 'EntryAbility'
  });
}

export async function waitReady(): Promise<void> {
  const deadline = Date.now() + 10000;
  while (Date.now() < deadline) {
    const bar = await driver().findComponent(ON.id('blur-tab-bar'));
    const last = await driver().findComponent(ON.id('tab-item-3'));
    if (bar && last) {
      const rect = await bar.getBounds();
      if (rect.right > rect.left && rect.bottom > rect.top) {
        if (initialFirstImage === undefined) {
          initialFirstImage = await (await requireId('background-image-0')).getBounds();
        }
        return;
      }
    }
    await driver().delayMs(100);
  }
  throw new Error('Real TabBar did not become ready');
}

export async function selectTab(index: number): Promise<void> {
  const id = 'tab-item-' + index;
  let item = await requireId(id);
  await item.click();
  const deadline = Date.now() + 2500;
  while (Date.now() < deadline) {
    let selected: boolean;
    try {
      selected = await item.isSelected();
    } catch (error) {
      if ((error as BusinessError).code !== 17000004) throw error as Error;
      item = await requireId(id);
      continue;
    }
    if (selected) return;
    await driver().delayMs(50);
  }
  throw new Error('Tab selection did not update: ' + index);
}

export async function assertSelection(expected: number): Promise<void> {
  let retried = false;
  while (true) {
    try {
      if (selectionItems.length === 0) {
        const items: Component[] = [];
        for (let index = 0; index < 4; index++) {
          items.push(await requireId('tab-item-' + index));
        }
        selectionItems = items;
      }
      for (let index = 0; index < 4; index++) {
        expect(await selectionItems[index].isSelected()).assertEqual(index === expected);
      }
      return;
    } catch (error) {
      if ((error as BusinessError).code !== 17000004 || retried) throw error as Error;
      selectionItems = [];
      retried = true;
    }
  }
}

export async function resetPage(restoreStart: boolean = true, initialSelection: number = 0): Promise<void> {
  selectionItems = [];
  await waitReady();
  if (restoreStart) await scrollToFirstImage();
  if (!await (await requireId('tab-item-' + initialSelection)).isSelected()) await selectTab(initialSelection);
}

export async function bounds(id: string): Promise<Rect> {
  return (await requireId(id)).getBounds();
}

export interface DrawingGeometry {
  left: number;
  top: number;
  width: number;
  height: number;
}

export function readDrawingGeometry(id: string): DrawingGeometry {
  const context = UIContext.getLastForegroundUIContext();
  if (!context) throw new Error('No foreground UI context for: ' + id);
  const geometry = context.getComponentUtils().getRectangleById(id);
  return { left: geometry.screenOffset.x, top: geometry.screenOffset.y,
    width: geometry.size.width, height: geometry.size.height };
}

export function positive(rect: Rect): boolean {
  return rect.right > rect.left && rect.bottom > rect.top;
}

export async function swipeBackground(): Promise<void> {
  await swipeSafeRegion(false, 3000);
}

export async function swipeBackgroundTowardStart(): Promise<void> {
  await swipeSafeRegion(true, 3000);
}

async function swipeSafeRegion(towardStart: boolean, speed: number): Promise<void> {
  const area = await bounds('background-list');
  const bar = await bounds('blur-tab-bar');
  const x = Math.floor((area.left + area.right) / 2);
  const bottom = Math.min(bar.top - 30, area.bottom - 40);
  const top = Math.floor(area.top + 80);
  await driver().swipe(x, towardStart ? top : bottom, x, towardStart ? bottom : top, speed);
}

export async function scrollToFirstImage(): Promise<void> {
  const initial = initialFirstImage;
  if (initial === undefined) throw new Error('Initial image geometry was not captured');
  for (let attempt = 0; attempt < 4; attempt++) {
    const first = await driver().findComponent(ON.id('background-image-0'));
    if (first) {
      const rect = await first.getBounds();
      if (rect.top === initial.top && rect.bottom === initial.bottom) return;
    }
    if (attempt < 3) {
      await swipeSafeRegion(true, 8000);
      await driver().waitForIdle(200, 1200);
    }
  }
  throw new Error('The first background image did not return to its initial geometry');
}

export async function scrollToLastImage(): Promise<void> {
  let endGeometry = '';
  for (let attempt = 0; attempt < 5; attempt++) {
    const last = await driver().findComponent(ON.id('background-image-9'));
    if (last) {
      const image = await last.getBounds();
      const bar = await bounds('blur-tab-bar');
      const list = await bounds('background-list');
      endGeometry = 'last=' + JSON.stringify(image) + ', list=' + JSON.stringify(list);
      if (positive(image) && image.top < bar.top && image.bottom === list.bottom) {
        const drawing = readDrawingGeometry('background-image-9');
        if (Math.abs(image.top - drawing.top) < 1 &&
          Math.abs(image.bottom - drawing.top - drawing.height) < 1) {
          const idle = await driver().waitForIdle(200, 1200);
          const settled = await bounds('background-image-9');
          if (idle && settled.top === image.top && settled.bottom === list.bottom) return;
        }
      }
    }
    if (attempt < 4) {
      await swipeSafeRegion(false, 8000);
      await driver().waitForIdle(200, 1200);
    }
  }
  throw new Error('The tenth background image did not settle at the list end: ' + endGeometry);
}

export async function captureScreenshot(name: string): Promise<void> {
  const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
  expect(await driver().screenCap(context.filesDir + '/' + name + '.png')).assertTrue();
}

export async function sampleAbilityState(): Promise<string> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const result = await delegator.executeShellCommand('aa dump -a', 2);
  expect(result.exitCode).assertEqual(0);
  const bundle = abilityDelegatorRegistry.getArguments().bundleName;
  const blocks = result.stdResult.split('AbilityRecord ID #');
  for (const block of blocks) {
    if (block.includes('main name [EntryAbility]') && block.includes('bundle name [' + bundle + ']')) {
      const state = block.match(/\n\s+state #([A-Z_]+)/);
      if (state) return state[1];
    }
  }
  throw new Error('EntryAbility system state not found');
}

export async function backgroundAndRestore(): Promise<void> {
  expect(await sampleAbilityState()).assertEqual('FOREGROUND');
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  let enteredBackgroundAt = -1;
  let enteredForeground = false;
  const monitor: abilityDelegatorRegistry.InteropAbilityMonitor = {
    abilityName: 'EntryAbility', moduleName: 'entry',
    onAbilityBackground: (): void => {
      if (enteredBackgroundAt < 0) enteredBackgroundAt = Date.now();
    },
    onAbilityForeground: (): void => { enteredForeground = true; }
  };
  delegator.addInteropAbilityMonitorSync(monitor);
  try {
    selectionItems = [];
    await driver().pressHome();
    const backgroundDeadline = Date.now() + 3000;
    const retryHomeAt = backgroundDeadline - 2800;
    while (enteredBackgroundAt < 0 && Date.now() < retryHomeAt) {
      await new Promise<void>((resolve) => { setTimeout(resolve, 10); });
    }
    if (enteredBackgroundAt < 0 && Date.now() < backgroundDeadline) {
      const state = await sampleAbilityState();
      if (enteredBackgroundAt < 0 && state === 'FOREGROUND' && Date.now() < backgroundDeadline) {
        await driver().pressHome();
      }
    }
    await waitLifecycleEvent((): boolean => enteredBackgroundAt >= 0 &&
      enteredBackgroundAt < backgroundDeadline, 'BACKGROUND', backgroundDeadline);
    expect(await driver().findComponent(ON.id('blur-tab-bar'))).assertNull();
    enteredForeground = false;
    await launchSample();
    const foregroundDeadline = Date.now() + 3000;
    await waitLifecycleEvent((): boolean => enteredForeground && Date.now() < foregroundDeadline,
      'FOREGROUND', foregroundDeadline);
    await waitReady();
  } finally {
    delegator.removeInteropAbilityMonitorSync(monitor);
  }
}

async function waitLifecycleEvent(observed: () => boolean, expected: string,
  deadline: number = Date.now() + 3000): Promise<void> {
  while (true) {
    if (observed()) return;
    if (Date.now() >= deadline) break;
    await new Promise<void>((resolve) => { setTimeout(resolve, 10); });
  }
  throw new Error('Ability lifecycle event was not observed: ' + expected);
}

// ADAPTATION_SHARED_BEGIN
// These helpers preserve the reference driver's strict, serialized UI boundary.
export interface ObservedTitle {
  text: string;
  rect: Rect;
  enabled: boolean;
}

export interface ObservedNode extends ObservedTitle {
  id: string;
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
    const component = await driver().findComponent(ON.id(id));
    if (component) {
      const actual = await component.getText();
      if (actual === expectedText) {
        return;
      }
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

export function assertNodeText(node: ObservedTitle, expected: string): void {
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

export async function assertUniqueId(id: string): Promise<Component> {
  const matches = await driver().findComponents(ON.id(id));
  const count = matches ? matches.length : 0;
  expect(count).assertEqual(1);
  if (matches === null) throw new Error('Missing component: ' + id);
  return matches[0];
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
  let component = await findExactId(id);
  let previous = await component.getBounds();
  const deadline = Date.now() + 1800;
  let matchingSamples: number = 0;
  while (Date.now() < deadline) {
    await serializedDelay(60);
    let current: Rect;
    try {
      current = await component.getBounds();
    } catch (error) {
      const failure = error as BusinessError;
      if (failure.code !== 17000004) {
        throw new Error('Unable to sample bounds for ' + id + ': ' + failure.code + ' ' + failure.message);
      }
      component = await findExactId(id);
      previous = await component.getBounds();
      matchingSamples = 0;
      continue;
    }
    const equal = current.left === previous.left && current.top === previous.top &&
      current.right === previous.right && current.bottom === previous.bottom;
    matchingSamples = equal ? matchingSamples + 1 : 0;
    previous = current;
    if (matchingSamples >= 2) {
      component = await findExactId(id);
      let verified: Rect;
      try {
        verified = await component.getBounds();
      } catch (error) {
        const failure = error as BusinessError;
        if (failure.code !== 17000004) {
          throw new Error('Unable to sample bounds for ' + id + ': ' + failure.code + ' ' + failure.message);
        }
        component = await findExactId(id);
        previous = await component.getBounds();
        matchingSamples = 0;
        continue;
      }
      if (verified.left === current.left && verified.top === current.top &&
        verified.right === current.right && verified.bottom === current.bottom) {
        assertPositiveRect(verified);
        return verified;
      }
      previous = verified;
      matchingSamples = 0;
    }
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
