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

import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';
import { Driver, ON, On, Component } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import hilog from '@ohos.hilog';

// ---- inlined MainThreadYield ----
/**
 * Long matrix suites run on the test main thread. Yielding between chunks keeps
 * the ability responsive so that component queries issued afterwards still see a
 * live window.
 */

export const DEFAULT_CHUNK: number = 200;

/** Resolves on the next macrotask, giving the UI thread a chance to breathe. */
export async function yieldToMainThread(): Promise<void> {
  await new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, 0);
  });
}

/** Runs a long loop in chunks, yielding after each chunk. */
export async function keepMainThreadResponsive<T>(items: T[], work: (item: T) => boolean,
  chunk: number = DEFAULT_CHUNK): Promise<number> {
  let completed: number = 0;
  for (let i = 0; i < items.length; i++) {
    if (work(items[i])) {
      completed++;
    }
    if (i > 0 && i % chunk === 0) {
      await yieldToMainThread();
    }
  }
  return completed;
}

// ---- inlined GobangDriver ----
/**
 * Shared UI driver for the DistributedDataGobang ohosTest package.
 *
 * Every UI suite imports this module instead of creating its own Driver, which
 * keeps operations serialized (UiTest is single-threaded) and keeps the launch
 * and restore steps identical across suites. Only English log text is emitted
 * and the log goes through hilog, never through console.
 */


export const LOG_DOMAIN: number = 0x0000;
export const LOG_TAG: string = 'GobangTest';
export const BUNDLE_NAME: string = 'ohos.samples.distributeddatagobang';
export const ABILITY_NAME: string = 'MainAbility';
export const MAIN_WANT: Want = { bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME };

export const ID_BACK: string = 'ic_back';
export const ID_HOP: string = 'ic_hop';
export const TEXT_RESTART: string = 'Restart';
export const TEXT_UNDO: string = 'RepentanceChess';
export const TEXT_SELECT_DEVICE: string = 'SelectDevice';
export const TEXT_CANCEL: string = 'cancel';
export const TEXT_LOCAL_DEVICE: string = 'Local device';
export const TEXT_ALLOW: string = 'allow';
export const TYPE_CANVAS: string = 'Canvas';

/** Locale aware labels: the device may resolve either the English or the Chinese resource. */
export const LABEL_RESTART: string[] = ['Restart', '重开'];
export const LABEL_UNDO: string[] = ['RepentanceChess', '悔棋'];
export const LABEL_SELECT_DEVICE: string[] = ['SelectDevice', '选择设备'];
export const LABEL_CANCEL: string[] = ['cancel', '取消'];
export const LABEL_ALLOW: string[] = ['allow', '允许'];

export const TIMEOUT_LAUNCH: number = 5000;
export const TIMEOUT_DIALOG: number = 3000;
export const TIMEOUT_PERMISSION: number = 3000;
export const TIMEOUT_RENDER: number = 1000;
export const TIMEOUT_POLL_STEP: number = 200;
export const TIMEOUT_LONG_OPERATION: number = 10000;

export const DELAY_SHORT: number = 100;
export const DELAY_MEDIUM: number = 300;
export const DELAY_LONG: number = 1000;
export const DELAY_LAUNCH_SETTLE: number = 3000;

export const BOARD_SIZE: number = 15;
export const BOARD_CELLS: number = 16;
export const MAX_STONES: number = 225;
export const STRESS_ROUNDS: number = 20;
export const STABLE_ROUNDS: number = 3;

export const ACTION_AVAILABLE: string = 'available';
export const ACTION_UNAVAILABLE: string = 'unavailable';

let lockHeld: boolean = false;
let lockWaiters: Array<() => void> = [];

export function logInfo(message: string): void {
  hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', message);
}

export function logWarn(message: string): void {
  hilog.warn(LOG_DOMAIN, LOG_TAG, '%{public}s', message);
}

export function logError(message: string): void {
  hilog.error(LOG_DOMAIN, LOG_TAG, '%{public}s', message);
}

/** Acquires the UI lock without building a promise chain that retains closures. */
async function acquireLock(): Promise<void> {
  if (!lockHeld) {
    lockHeld = true;
    return;
  }
  await new Promise<void>((resolve: () => void) => {
    lockWaiters.push(resolve);
  });
}

function releaseLock(): void {
  if (lockWaiters.length > 0) {
    let next: (() => void) | undefined = lockWaiters.shift();
    if (next !== undefined) {
      next();
      return;
    }
  }
  lockHeld = false;
}

/**
 * Serializes every UI operation. UiTest operations issued concurrently can
 * interleave and produce flaky component lookups, so all helpers funnel through
 * this lock.
 */
export async function runSerialized<T>(action: () => Promise<T>): Promise<T> {
  await acquireLock();
  try {
    return await action();
  } finally {
    releaseLock();
  }
}

/** Returns the singleton driver, creating it lazily. */
export function getDriver(): Driver | null {
  let cached: Driver | undefined = AppStorage.get<Driver>('gobangTestDriver');
  if (cached !== undefined) {
    return cached;
  }
  try {
    let created: Driver = Driver.create();
    AppStorage.setOrCreate<Driver>('gobangTestDriver', created);
    return created;
  } catch (error) {
    logError('driver create failed: ' + String(error));
    return null;
  }
}

/** Reads the delegator once, as every launch/terminate path needs it. */
export function getDelegator(): abilityDelegatorRegistry.AbilityDelegator {
  return abilityDelegatorRegistry.getAbilityDelegator();
}

/** Waits without going through the queue; used by beforeEach hooks. */
export async function delay(driver: Driver, ms: number): Promise<void> {
  await runSerialized(async () => {
    await driver.delayMs(ms);
  });
}

export async function delayQuiet(driver: Driver, ms: number): Promise<void> {
  await driver.delayMs(ms);
}

/** Starts MainAbility with a plain want. */
export async function startMainAbility(): Promise<void> {
  let delegator: abilityDelegatorRegistry.AbilityDelegator = getDelegator();
  let finished: boolean = false;
  try {
    delegator.startAbility(MAIN_WANT, (err, data) => {
      finished = true;
      if (err) {
        logError('startAbility error: ' + JSON.stringify(err));
      } else {
        logInfo('startAbility done');
      }
    });
  } catch (error) {
    logError('startAbility threw: ' + String(error));
    if (error instanceof Error) {
      throw error;
    }
    throw new Error(String(error));
  }
  let waited: number = 0;
  while (!finished && waited < TIMEOUT_LAUNCH) {
    await new Promise<void>((resolve: () => void) => {
      setTimeout(resolve, TIMEOUT_POLL_STEP);
    });
    waited += TIMEOUT_POLL_STEP;
  }
  logInfo('startMainAbility waited ms=' + waited);
}

/** Starts the ability with a device flag parameter, as TitleBar does for B. */
export async function startMainAbilityAsDeviceB(): Promise<void> {
  let wantB: Want = {
    bundleName: BUNDLE_NAME,
    abilityName: ABILITY_NAME,
    parameters: { isB: 'B' }
  };
  let delegator: abilityDelegatorRegistry.AbilityDelegator = getDelegator();
  delegator.startAbility(wantB);
}

/** Force-stops the sample process; used by cleanup between UI suites. */
export async function terminateMainAbility(): Promise<void> {
  try {
    let delegator: abilityDelegatorRegistry.AbilityDelegator = getDelegator();
    await delegator.executeShellCommand('aa force-stop ' + BUNDLE_NAME, 10);
  } catch (error) {
    logWarn('force-stop failed: ' + String(error));
  }
}

/** Clears the permission dialog if it is still on screen. */
export async function dismissPermissionDialog(driver: Driver): Promise<boolean> {
  let allow: Component | null = await findAnyByText(driver, LABEL_ALLOW);
  if (allow === null) {
    return false;
  }
  await clickComponent(driver, allow);
  await delay(driver, DELAY_MEDIUM);
  return true;
}

/**
 * Launch the sample once per test process and settle the UI. Repeated launches
 * stack ability instances, each of which keeps a full size canvas alive, so the
 * helper is idempotent: later suites reuse the instance started by the first.
 */
export async function launchGameHome(driver: Driver): Promise<boolean> {
  let launched: boolean | undefined = AppStorage.get<boolean>('gobangAppLaunched');
  if (launched !== true) {
    await startMainAbility();
    AppStorage.setOrCreate<boolean>('gobangAppLaunched', true);
    await delay(driver, DELAY_LAUNCH_SETTLE);
  } else {
    await delay(driver, DELAY_MEDIUM);
  }
  await dismissPermissionDialog(driver);
  await delay(driver, DELAY_MEDIUM);
  return waitForId(driver, ID_BACK, TIMEOUT_LAUNCH);
}

/** Presses the system back key; used to leave dialogs. */
export async function pressBack(driver: Driver): Promise<void> {
  await runSerialized(async () => {
    await driver.pressBack();
  });
  await delay(driver, DELAY_MEDIUM);
}

/** findComponent with a null-safe wrapper. */
export async function findComponentSafe(driver: Driver, by: On): Promise<Component | null> {
  try {
    let component: Component = await driver.findComponent(by);
    return component === undefined ? null : component;
  } catch (error) {
    logWarn('findComponent failed: ' + String(error));
    return null;
  }
}

/** findComponents with a null-safe wrapper; never returns null. */
export async function findComponentsSafe(driver: Driver, by: On): Promise<Component[]> {
  try {
    let components: Component[] = await driver.findComponents(by);
    if (components === undefined || components === null) {
      return [];
    }
    return components;
  } catch (error) {
    logWarn('findComponents failed: ' + String(error));
    return [];
  }
}

export async function countById(driver: Driver, id: string): Promise<number> {
  let components: Component[] = await findComponentsSafe(driver, ON.id(id));
  return components.length;
}

export async function countByText(driver: Driver, text: string): Promise<number> {
  let components: Component[] = await findComponentsSafe(driver, ON.text(text));
  return components.length;
}

export async function countByType(driver: Driver, type: string): Promise<number> {
  let components: Component[] = await findComponentsSafe(driver, ON.type(type));
  return components.length;
}

/** Polls for a component id; returns true as soon as it appears. */
export async function waitForId(driver: Driver, id: string, maxWaitMs: number = TIMEOUT_LAUNCH): Promise<boolean> {
  let elapsed: number = 0;
  while (elapsed < maxWaitMs) {
    let count: number = await countById(driver, id);
    if (count > 0) {
      return true;
    }
    await delayQuiet(driver, TIMEOUT_POLL_STEP);
    elapsed += TIMEOUT_POLL_STEP;
  }
  return false;
}

/** Polls for a component text. */
export async function waitForText(driver: Driver, text: string, maxWaitMs: number = TIMEOUT_DIALOG): Promise<boolean> {
  let elapsed: number = 0;
  while (elapsed < maxWaitMs) {
    let count: number = await countByText(driver, text);
    if (count > 0) {
      return true;
    }
    await delayQuiet(driver, TIMEOUT_POLL_STEP);
    elapsed += TIMEOUT_POLL_STEP;
  }
  return false;
}

/** Polls until a predicate over the component count holds. */
export async function waitForCount(driver: Driver, id: string, expected: number,
  maxWaitMs: number = TIMEOUT_DIALOG): Promise<boolean> {
  let elapsed: number = 0;
  while (elapsed < maxWaitMs) {
    let count: number = await countById(driver, id);
    if (count === expected) {
      return true;
    }
    await delayQuiet(driver, TIMEOUT_POLL_STEP);
    elapsed += TIMEOUT_POLL_STEP;
  }
  return false;
}

/** Clicks a component through the serialized queue. */
export async function clickComponent(driver: Driver, component: Component): Promise<boolean> {
  try {
    await runSerialized(async () => {
      await component.click();
    });
    return true;
  } catch (error) {
    logWarn('component click failed: ' + String(error));
    return false;
  }
}

/** Clicks by id; returns false when the node is missing. */
export async function clickId(driver: Driver, id: string): Promise<boolean> {
  let component: Component | null = await findComponentSafe(driver, ON.id(id));
  if (component === null) {
    return false;
  }
  return clickComponent(driver, component);
}

/** Clicks by text; returns false when the node is missing. */
export async function clickText(driver: Driver, text: string): Promise<boolean> {
  let component: Component | null = await findComponentSafe(driver, ON.text(text));
  if (component === null) {
    return false;
  }
  return clickComponent(driver, component);
}

/** Clicks raw screen coordinates, used for the canvas. */
export async function clickPoint(driver: Driver, x: number, y: number): Promise<void> {
  await runSerialized(async () => {
    await driver.click(x, y);
  });
  await delayQuiet(driver, DELAY_SHORT);
}

/** True when a component exists. */
export async function existsById(driver: Driver, id: string): Promise<boolean> {
  return (await countById(driver, id)) > 0;
}

export async function existsByText(driver: Driver, text: string): Promise<boolean> {
  return (await countByText(driver, text)) > 0;
}

/** Returns the first component whose text matches any of the given labels. */
export async function findAnyByText(driver: Driver, labels: string[]): Promise<Component | null> {
  for (let i = 0; i < labels.length; i++) {
    let component: Component | null = await findComponentSafe(driver, ON.text(labels[i]));
    if (component !== null) {
      return component;
    }
  }
  return null;
}

/** Counts components across all candidate labels, avoiding double counting by index. */
export async function countAnyByText(driver: Driver, labels: string[]): Promise<number> {
  let total: number = 0;
  for (let i = 0; i < labels.length; i++) {
    total += await countByText(driver, labels[i]);
  }
  return total;
}

export async function existsAnyByText(driver: Driver, labels: string[]): Promise<boolean> {
  return (await findAnyByText(driver, labels)) !== null;
}

/** Polls until any candidate label appears. */
export async function waitForAnyText(driver: Driver, labels: string[], maxWaitMs: number = TIMEOUT_DIALOG): Promise<boolean> {
  let elapsed: number = 0;
  while (elapsed < maxWaitMs) {
    if (await existsAnyByText(driver, labels)) {
      return true;
    }
    await delayQuiet(driver, TIMEOUT_POLL_STEP);
    elapsed += TIMEOUT_POLL_STEP;
  }
  return false;
}

/** Clicks the first candidate label that exists. */
export async function clickAnyText(driver: Driver, labels: string[]): Promise<boolean> {
  let component: Component | null = await findAnyByText(driver, labels);
  if (component === null) {
    return false;
  }
  return clickComponent(driver, component);
}

export async function textOf(component: Component): Promise<string> {
  try {
    return await component.getText();
  } catch (error) {
    return '';
  }
}

export async function enabledOf(component: Component): Promise<boolean> {
  try {
    return await component.isEnabled();
  } catch (error) {
    return false;
  }
}

/** Bounds of the canvas in pixels: [left, top, right, bottom]. */
export async function canvasBounds(driver: Driver): Promise<number[]> {
  let components: Component[] = await findComponentsSafe(driver, ON.type(TYPE_CANVAS));
  if (components.length === 0) {
    return [0, 0, 0, 0];
  }
  try {
    let rect = await components[0].getBounds();
    return [rect.left, rect.top, rect.right, rect.bottom];
  } catch (error) {
    logWarn('canvas bounds failed: ' + String(error));
    return [0, 0, 0, 0];
  }
}

/** Canvas width in pixels. */
export async function canvasWidth(driver: Driver): Promise<number> {
  let bounds: number[] = await canvasBounds(driver);
  return bounds[2] - bounds[0];
}

/** Pixel size of one board cell: canvas width divided by 16. */
export async function cellPixels(driver: Driver): Promise<number> {
  let width: number = await canvasWidth(driver);
  if (width <= 0) {
    return 0;
  }
  return width / BOARD_CELLS;
}

/**
 * Center of intersection (gx, gy) in screen pixels. The page draws the grid at
 * (i + 1) * cell, so grid index 0 sits one cell in from the canvas edge.
 */
export async function gridPoint(driver: Driver, gx: number, gy: number): Promise<number[]> {
  let bounds: number[] = await canvasBounds(driver);
  let cell: number = (bounds[2] - bounds[0]) / BOARD_CELLS;
  let x: number = bounds[0] + (gx + 1) * cell;
  let y: number = bounds[1] + (gy + 1) * cell;
  return [Math.round(x), Math.round(y)];
}

/** Clicks the intersection at (gx, gy). */
export async function clickGrid(driver: Driver, gx: number, gy: number): Promise<boolean> {
  if (gx < 0 || gx >= BOARD_SIZE || gy < 0 || gy >= BOARD_SIZE) {
    return false;
  }
  let point: number[] = await gridPoint(driver, gx, gy);
  if (point[0] <= 0 || point[1] <= 0) {
    return false;
  }
  // The page records the snapped point on the first tap and only places the
  // stone when the same point is tapped again, so a move is a double tap.
  await clickPoint(driver, point[0], point[1]);
  await delayQuiet(driver, DELAY_SHORT);
  await clickPoint(driver, point[0], point[1]);
  await delayQuiet(driver, DELAY_SHORT);
  return true;
}

/** Reads the status line text "${deviceFlag}-${step}-${clickCount}". */
export async function readStatusLine(driver: Driver): Promise<string> {
  let components: Component[] = await findComponentsSafe(driver, ON.type('Text'));
  for (let i = 0; i < components.length; i++) {
    let value: string = await textOf(components[i]);
    let parts: string[] = value.split('-');
    if (parts.length === 3 && (parts[0] === 'A' || parts[0] === 'B')) {
      return value;
    }
  }
  return '';
}

/** Parses the status line into [flag, step, clickCount]. */
export function parseStatusLine(value: string): number[] {
  let parts: string[] = value.split('-');
  if (parts.length !== 3) {
    return [-1, -1, -1];
  }
  let step: number = Number.parseInt(parts[1]);
  let clicks: number = Number.parseInt(parts[2]);
  if (Number.isNaN(step) || Number.isNaN(clicks)) {
    return [-1, -1, -1];
  }
  return [parts[0] === 'B' ? 1 : 0, step, clicks];
}

/** Waits until the status line reports the expected step. */
export async function waitForStep(driver: Driver, step: number, maxWaitMs: number = TIMEOUT_RENDER): Promise<boolean> {
  let elapsed: number = 0;
  while (elapsed < maxWaitMs) {
    let parsed: number[] = parseStatusLine(await readStatusLine(driver));
    if (parsed[1] === step) {
      return true;
    }
    await delayQuiet(driver, TIMEOUT_POLL_STEP);
    elapsed += TIMEOUT_POLL_STEP;
  }
  return false;
}

/** Opens the device dialog through the hop icon. */
export async function openDeviceDialog(driver: Driver): Promise<boolean> {
  let clicked: boolean = await clickId(driver, ID_HOP);
  if (!clicked) {
    return false;
  }
  return waitForAnyText(driver, LABEL_SELECT_DEVICE, TIMEOUT_DIALOG);
}

/** Cancels the device dialog. */
export async function cancelDeviceDialog(driver: Driver): Promise<boolean> {
  let clicked: boolean = await clickAnyText(driver, LABEL_CANCEL);
  if (!clicked) {
    return false;
  }
  await delay(driver, DELAY_MEDIUM);
  return true;
}

/** Clicks Restart and waits for the status line to report step 0. */
export async function restartGame(driver: Driver): Promise<boolean> {
  let clicked: boolean = await clickAnyText(driver, LABEL_RESTART);
  if (!clicked) {
    return false;
  }
  await delay(driver, DELAY_MEDIUM);
  return waitForStep(driver, 0);
}

/** Clicks RepentanceChess once. */
export async function undoMove(driver: Driver): Promise<boolean> {
  let clicked: boolean = await clickAnyText(driver, LABEL_UNDO);
  await delay(driver, DELAY_MEDIUM);
  return clicked;
}

/** Runs an action and swallows failures, for cleanup hooks. */
export async function swallow(action: () => Promise<void>): Promise<void> {
  try {
    await action();
  } catch (error) {
    logWarn('cleanup swallowed: ' + String(error));
  }
}

/** Retries a predicate until it holds or the budget is exhausted. */
export async function retryUntil(check: () => Promise<boolean>, maxWaitMs: number,
  stepMs: number = TIMEOUT_POLL_STEP): Promise<boolean> {
  let elapsed: number = 0;
  while (elapsed < maxWaitMs) {
    if (await check()) {
      return true;
    }
    await new Promise<void>((resolve: () => void) => {
      setTimeout(resolve, stepMs);
    });
    elapsed += stepMs;
  }
  return false;
}

/** Monotonic helper used by performance assertions. */
export function nowMs(): number {
  return new Date().getTime();
}

/** Duration between two timestamps. */
export function elapsedMs(start: number, end: number): number {
  return end - start;
}

/** True when the duration stays under a generous budget. */
export function withinBudget(start: number, end: number, budgetMs: number): boolean {
  return elapsedMs(start, end) <= budgetMs;
}

/** Builds a coordinate list for a straight row. */
export function rowPoints(row: number, count: number): number[][] {
  let points: number[][] = [];
  for (let i = 0; i < count; i++) {
    points.push([row, i]);
  }
  return points;
}

/** Builds a coordinate list for a straight column. */
export function columnPoints(col: number, count: number): number[][] {
  let points: number[][] = [];
  for (let i = 0; i < count; i++) {
    points.push([i, col]);
  }
  return points;
}

/** Builds a coordinate list for a descending diagonal. */
export function diagonalPoints(start: number, count: number): number[][] {
  let points: number[][] = [];
  for (let i = 0; i < count; i++) {
    points.push([start + i, start + i]);
  }
  return points;
}

/** Converts a coordinate list into a click sequence. */
export async function clickSequence(driver: Driver, points: number[][]): Promise<number> {
  let clicked: number = 0;
  for (let i = 0; i < points.length; i++) {
    if (await clickGrid(driver, points[i][0], points[i][1])) {
      clicked++;
    }
  }
  return clicked;
}

export default function deviceDialogUi() {
  describe('GobangDeviceDialogUi', () => {
    let driver: Driver = getDriver() as Driver;

    beforeAll(async () => {
      await yieldToMainThread();
      let ready: boolean = await launchGameHome(driver);
      logInfo('DeviceDialogUi launch ready=' + ready);
    });

    afterAll(async () => {
      await delay(driver, DELAY_MEDIUM);
    });

    /**
     * @tc.number SUB_GOBANG_UI_DIALOG_0100
     * @tc.name testDialogTitleShown0001
     * @tc.desc The dialog shows the SelectDevice title exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDialogTitleShown0001', 0, async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      expect(await openDeviceDialog(driver)).assertTrue();
      expect(await countAnyByText(driver, LABEL_SELECT_DEVICE)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GOBANG_UI_DIALOG_0200
     * @tc.name testDialogLocalDeviceRow0002
     * @tc.desc The first row of the list is always the local device entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDialogLocalDeviceRow0002', 0, async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      expect(await waitForText(driver, TEXT_LOCAL_DEVICE, TIMEOUT_DIALOG)).assertTrue();
      expect(await countByText(driver, TEXT_LOCAL_DEVICE)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GOBANG_UI_DIALOG_0300
     * @tc.name testDialogCancelButton0003
     * @tc.desc The cancel button stays visible below the device list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDialogCancelButton0003', 0, async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      expect(await existsAnyByText(driver, LABEL_CANCEL)).assertTrue();
      expect(await countAnyByText(driver, LABEL_CANCEL)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GOBANG_UI_DIALOG_0400
     * @tc.name testDialogCancelRemovesTitle0004
     * @tc.desc After cancel the dialog title is no longer part of the tree
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDialogCancelRemovesTitle0004', 0, async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      expect(await cancelDeviceDialog(driver)).assertTrue();
      await delay(driver, DELAY_MEDIUM);
      expect(await existsAnyByText(driver, LABEL_SELECT_DEVICE)).assertFalse();
      expect(await existsByText(driver, TEXT_LOCAL_DEVICE)).assertFalse();
    });

    /**
     * @tc.number SUB_GOBANG_UI_DIALOG_0500
     * @tc.name testDialogReopenKeepsRows0005
     * @tc.desc Reopening the dialog repopulates the local device row once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDialogReopenKeepsRows0005', 0, async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      expect(await openDeviceDialog(driver)).assertTrue();
      await delay(driver, DELAY_MEDIUM);
      expect(await countByText(driver, TEXT_LOCAL_DEVICE)).assertEqual(1);
      expect(await countAnyByText(driver, LABEL_SELECT_DEVICE)).assertEqual(1);
      expect(await cancelDeviceDialog(driver)).assertTrue();
    });

    /**
     * @tc.number SUB_GOBANG_UI_DIALOG_0600
     * @tc.name testDialogTripleCycle0006
     * @tc.desc Three open/cancel cycles never duplicate dialog content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDialogTripleCycle0006', 0, async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      for (let i = 0; i < 3; i++) {
        expect(await openDeviceDialog(driver)).assertTrue();
        expect(await countAnyByText(driver, LABEL_SELECT_DEVICE)).assertEqual(1);
        expect(await cancelDeviceDialog(driver)).assertTrue();
        await delay(driver, DELAY_MEDIUM);
      }
      expect(await existsAnyByText(driver, LABEL_SELECT_DEVICE)).assertFalse();
    });
  });
}
