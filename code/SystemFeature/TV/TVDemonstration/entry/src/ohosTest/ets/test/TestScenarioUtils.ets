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
 * Shared scenario builders for the TVDemonstration ohosTest suites.
 */

import { KeyCode } from '@kit.InputKit';
import { Component, Driver, ON } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';

/**
 * Starts the app under test with a bounded retry. On the TVDemonstration device,
 * abilityDelegator.startAbility can reject instantly ("startAbility failed.")
 * when the EntryAbility is left in a residual running state by an earlier case
 * or session. For a foreign bundle a force-stop through the delegator clears
 * that state before the retry; for our own bundle the retry backs off instead,
 * because force-stopping it would kill the running ohosTest process.
 */
export async function startAppWithRetry(want: Want, bundleName: string, attempts: number = 3): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  // The ohosTest module runs inside the same bundle as the app under test, so
  // "aa force-stop <bundle>" also kills the test process. The runner then
  // reports "App died" and aborts every remaining suite. Never force-stop our
  // own bundle; a startAbility rejection there normally means EntryAbility is
  // already running in the residual session.
  const testBundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
  const isSelfBundle: boolean = bundleName === testBundleName;
  for (let attempt: number = 0; attempt < attempts; attempt++) {
    try {
      await delegator.startAbility(want);
      return;
    } catch (error) {
      if (attempt >= attempts - 1) {
        if (isSelfBundle) {
          return;
        }
        throw error as Error;
      }
      if (!isSelfBundle) {
        try {
          await delegator.executeShellCommand('aa force-stop ' + bundleName);
        } catch (stopError) {
          // ignore force-stop failure and retry the start anyway
        }
      }
      await new Promise<void>((resolve: () => void): void => {
        setTimeout(resolve, 600);
      });
    }
  }
}

/**
 * Polls until a component with the given text appears in the current UI tree.
 * Card catalogs are built lazily on first tab entry, so a fixed settle delay
 * races the first render on a coverage-instrumented build and makes every
 * following spec fail with "Component not exist matching". Returns true when
 * the text became visible, false when the budget expires.
 */
export async function waitForText(driver: Driver, text: string, maxWaitMs: number = 5000): Promise<boolean> {
  const pollStepMs: number = 200;
  let elapsedMs: number = 0;
  while (elapsedMs < maxWaitMs) {
    const nodes: Component[] = await driver.findComponents(ON.text(text));
    if (nodes !== null && nodes.length > 0) {
      return true;
    }
    await driver.delayMs(pollStepMs);
    elapsedMs += pollStepMs;
  }
  return false;
}

/**
 * Polls for a component identified by id to appear in the current UI tree,
 * instead of trusting a fixed settle delay. A coverage-instrumented build can
 * take several seconds to render its first frame after startAbility (especially
 * on a fresh install), so a bounded poll keeps the shared restore helpers green
 * without adding a fixed latency to every case. Returns the component once it is
 * visible, or null if the deadline expires.
 */
export async function waitForComponentById(driver: Driver, id: string,
  maxWaitMs: number = 20000): Promise<Component | null> {
  const pollStepMs: number = 250;
  let elapsedMs: number = 0;
  let component: Component | null = await driver.findComponent(ON.id(id));
  while ((component === null || component === undefined) && elapsedMs < maxWaitMs) {
    await driver.delayMs(pollStepMs);
    elapsedMs += pollStepMs;
    component = await driver.findComponent(ON.id(id));
  }
  return component;
}

/**
 * Polls until the persistent tab bar root (tab0) is present in the UI tree.
 * This is the shared precondition of the launcher suites: every restore helper
 * first brings EntryAbility to the foreground and then waits for the Index
 * page to materialize before exercising tabs, details or remote input.
 *
 * The default budget stays below the harness per-spec timeout (`aa test -s
 * timeout 15000`): a spec that times out while still polling leaves UiTest busy
 * and makes every following Driver.create fail with "uitest-api dose not allow
 * calling concurrently".
 */
export async function waitForRootTabBar(driver: Driver, maxWaitMs: number = 8000): Promise<void> {
  const pollStepMs: number = 250;
  let elapsedMs: number = 0;
  let visible: boolean = false;
  while (elapsedMs < maxWaitMs) {
    const rootTab: Component | null = await driver.findComponent(ON.id('tab0'));
    if (rootTab !== null && rootTab !== undefined) {
      visible = true;
      break;
    }
    await driver.delayMs(pollStepMs);
    elapsedMs += pollStepMs;
  }
  if (!visible) {
    await driver.assertComponentExist(ON.id('tab0'));
  }
}

/**
 * Returns four behavior-oriented remote paths for one chaos suite.
 *
 * The suites deliberately exercise distinct state transitions instead of
 * enumerating ordinary permutations whose assertions are identical. Keeping
 * the paths centralized also prevents the test source from becoming a data dump.
 */
export function buildChaosScenarios(part: number): number[][] {
  const up: number = KeyCode.KEYCODE_DPAD_UP;
  const right: number = KeyCode.KEYCODE_DPAD_RIGHT;
  const down: number = KeyCode.KEYCODE_DPAD_DOWN;
  const left: number = KeyCode.KEYCODE_DPAD_LEFT;
  const scenarios: number[][][] = [
    [
      [up, up, up, up],
      [down, down, down, down],
      [left, left, right, right],
      [right, right, left, left],
    ],
    [
      [up, right, down, left],
      [right, down, left, up],
      [up, down, up, down],
      [left, right, left, right],
    ],
    [
      [up, right, up, left, down, right],
      [down, left, down, right, up, left],
      [up, up, right, down, left, down],
      [right, right, down, left, up, left],
    ],
  ];
  const selectedPart: number = Math.max(1, Math.min(part, scenarios.length));
  return scenarios[selectedPart - 1];
}


function buildCuratedPaths(values: number[], pathCount: number, startOffset: number, pathLength: number): number[][] {
  const pathTemplates: number[][] = [
    [0, 1, 2, 3, 1, 3],
    [2, 2, 1, 1, 0, 3],
    [3, 0, 1, 2, 0, 2],
    [1, 1, 3, 3, 2, 0],
    [0, 0, 0, 2, 2, 2],
    [3, 3, 3, 1, 1, 1],
    [1, 2, 3, 0, 1, 2],
    [2, 3, 0, 1, 2, 3]
  ];
  const selectedCount: number = Math.min(pathCount, pathTemplates.length);
  const paths: number[][] = [];
  for (let scenarioIndex: number = 0; scenarioIndex < selectedCount; scenarioIndex++) {
    const template: number[] = pathTemplates[(scenarioIndex + startOffset) % pathTemplates.length];
    const pathValues: number[] = [];
    // These paths target business transitions: edge clamping, reversal, round-trip,
    // cyclic movement, and mixed traversal. Keeping them explicit makes every replay
    // inspectable and prevents a large generated matrix from masquerading as coverage.
    const stepCount: number = Math.min(pathLength, template.length);
    for (let stepIndex: number = 0; stepIndex < stepCount; stepIndex++) {
      pathValues.push(values[template[stepIndex]]);
    }
    paths.push(pathValues);
  }
  return paths;
}

export function buildCheckpointPaths(pathLength: number, pathCount: number, startOffset: number): number[][] {
  const directionKeys: number[] = [
    KeyCode.KEYCODE_DPAD_UP,
    KeyCode.KEYCODE_DPAD_RIGHT,
    KeyCode.KEYCODE_DPAD_DOWN,
    KeyCode.KEYCODE_DPAD_LEFT,
  ];
  return buildCuratedPaths(directionKeys, pathCount, startOffset, pathLength);
}

export function buildCheckpointIndexPaths(pathLength: number, pathCount: number, startOffset: number): number[][] {
  const tabIndexes: number[] = [0, 1, 2, 3];
  return buildCuratedPaths(tabIndexes, pathCount, startOffset, pathLength);
}


/**
 * Keeps one representative for each remote-input behavior class.
 *
 * Directional boundaries, reversals, confirmation keys and mixed sequences
 * exercise different production event branches; ordinary permutations do not.
 */
export function buildRemoteScenarios(): number[][] {
  return [
    [KeyCode.KEYCODE_DPAD_RIGHT],
    [KeyCode.KEYCODE_DPAD_LEFT],
    [KeyCode.KEYCODE_DPAD_UP],
    [KeyCode.KEYCODE_DPAD_DOWN],
    [KeyCode.KEYCODE_DPAD_RIGHT, KeyCode.KEYCODE_DPAD_LEFT],
    [KeyCode.KEYCODE_DPAD_UP, KeyCode.KEYCODE_DPAD_DOWN],
    [KeyCode.KEYCODE_DPAD_UP, KeyCode.KEYCODE_DPAD_RIGHT, KeyCode.KEYCODE_DPAD_DOWN,
      KeyCode.KEYCODE_DPAD_LEFT],
    [KeyCode.KEYCODE_ENTER],
    [KeyCode.KEYCODE_DPAD_CENTER],
    [KeyCode.KEYCODE_DPAD_RIGHT, KeyCode.KEYCODE_ENTER, KeyCode.KEYCODE_DPAD_LEFT,
      KeyCode.KEYCODE_DPAD_CENTER],
  ];
}


const SENSITIVE_WORDS: string[] = [
  'password',
  'token',
  'secret',
  'apikey',
  'authorization',
  'cookie',
  'sessionid',
  'privatekey'
];

export interface SecurityScanResult {
  textCount: number;
  matchCount: number;
}

export async function scanVisibleText(driver: Driver): Promise<SecurityScanResult> {
  const texts: Component[] = await driver.findComponents(ON.type('Text'));
  let matchCount: number = 0;

  // The UI tree is the boundary users can inspect directly, so scanning the
  // rendered text catches accidental credential disclosure without pretending
  // to replace storage, log, IPC or network security analysis.
  for (let textIndex: number = 0; textIndex < texts.length; textIndex++) {
    const value: string = (await texts[textIndex].getText()).toLowerCase();
    for (let wordIndex: number = 0; wordIndex < SENSITIVE_WORDS.length; wordIndex++) {
      if (value.indexOf(SENSITIVE_WORDS[wordIndex]) >= 0) {
        matchCount++;
      }
    }
  }

  // Returning both counts lets callers prove that a real tree was inspected;
  // a zero match count alone could otherwise pass when no Text node was found.
  return {
    textCount: texts.length,
    matchCount: matchCount
  };
}

/**
 * Creates a UiTest Driver, retrying while a previous gesture is still being processed.
 * UiTest rejects Driver.create with "uitest-api dose not allow calling concurrently"
 * when the previous swipe/findComponent call has not finished yet.
 */
export async function createDriverWithRetry(attempts: number = 5): Promise<Driver> {
  for (let attempt: number = 0; attempt < attempts; attempt++) {
    try {
      return Driver.create();
    } catch (error) {
      await new Promise<void>((resolve) => {
        setTimeout(() => {
          resolve();
        }, 250);
      });
    }
  }
  throw new Error('Driver.create failed: uitest api stayed busy');
}