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

import { Driver, ON, Component } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import hilog from '@ohos.hilog';

export const LOG_TAG: string = 'TvDemoShared';
export const BUNDLE_NAME: string = 'com.sample.demonstration';
export const ABILITY_NAME: string = 'EntryAbility';
export const MAIN_WANT: Want = { bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME };

export const KEY_LEFT: number = 2014;
export const KEY_RIGHT: number = 2015;
export const KEY_UP: number = 2012;
export const KEY_DOWN: number = 2013;
export const KEY_ENTER: number = 2049;
export const KEY_BACK: number = 2;
export const KEY_HOME: number = 3;

export const TIMEOUT_DIALOG_RENDER: number = 1000;
export const TIMEOUT_POWER_OPERATION: number = 2000;
export const TIMEOUT_SESSION_CREATE: number = 1000;
export const TIMEOUT_FOCUS_CHANGE: number = 500;

export const DELAY_KEY_NAVIGATION: number = 50;
export const DELAY_TOUCH_EVENT: number = 100;
export const DELAY_AFTER_OPERATION: number = 500;

export const TOLERANCE_COMPONENT_COUNT: number = 3;
export const TOLERANCE_FOCUS_CHANGE: number = 2;
export const STABLE_ROUNDS: number = 1;
export const STABLE_TOLERANCE: number = 3;
export const STRESS_ROUNDS_NAVIGATION: number = 20;
export const STRESS_ROUNDS_LIFECYCLE: number = 10;

let sharedDriver: Driver | null = null;
let queue: Promise<void> = Promise.resolve();

export async function runSerializedUiOperation<T>(action: () => Promise<T>): Promise<T> {
  const current: Promise<void> = queue;
  return new Promise<T>((resolve: (value: T) => void, reject: (reason: Error) => void) => {
    queue = current.then(async () => {
      try {
        resolve(await action());
      } catch (error) {
        reject(error instanceof Error ? error : new Error(String(error)));
      }
    }).catch((error: Error) => {
      reject(error);
    });
  });
}

export async function serializedDelay(driver: Driver, delayMs: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.delayMs(delayMs);
  });
}

export function getDriver(): Driver | null {
  if (sharedDriver === null) {
    try {
      sharedDriver = Driver.create();
    } catch (error) {
      sharedDriver = null;
      hilog.error(0x0000, LOG_TAG, 'driver create failed: %{public}s', String(error));
    }
  }
  return sharedDriver;
}

export async function componentCount(driver: Driver, id: string): Promise<number> {
  const nodes: Component[] | null = await driver.findComponents(ON.id(id));
  return nodes === null ? 0 : nodes.length;
}

export async function textCount(driver: Driver, text: string): Promise<number> {
  const nodes: Component[] | null = await driver.findComponents(ON.text(text));
  return nodes === null ? 0 : nodes.length;
}

export async function waitForText(driver: Driver, text: string, maxWaitMs: number = 5000): Promise<boolean> {
  const step: number = 200;
  let elapsed: number = 0;
  while (elapsed < maxWaitMs) {
    const nodes: Component[] | null = await driver.findComponents(ON.text(text));
    if (nodes !== null && nodes.length > 0) {
      return true;
    }
    await driver.delayMs(step);
    elapsed += step;
  }
  return false;
}

export async function checkFocus(driver: Driver, id: string): Promise<boolean> {
  const node: Component | null = await driver.findComponent(ON.id(id));
  if (node === null) {
    return false;
  }
  return node.isFocused();
}

export function clamp(value: number, size: number): number {
  if (size <= 0) {
    return 0;
  }
  if (value < 0) {
    return 0;
  }
  return value >= size ? size - 1 : value;
}

export function checksum(text: string): number {
  let total: number = 0;
  for (let i: number = 0; i < text.length; i++) {
    total = (total * 31 + text.charCodeAt(i)) % 1000003;
  }
  return total;
}

/** Deterministic helper 1: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex1(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 1: exposes a stable checksum for the given label. */
export function labelChecksum1(label: string): number {
  return checksum(label) % 101;
}

/** Deterministic helper 2: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex2(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 2: exposes a stable checksum for the given label. */
export function labelChecksum2(label: string): number {
  return checksum(label) % 102;
}

/** Deterministic helper 3: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex3(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 3: exposes a stable checksum for the given label. */
export function labelChecksum3(label: string): number {
  return checksum(label) % 103;
}

/** Deterministic helper 4: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex4(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 4: exposes a stable checksum for the given label. */
export function labelChecksum4(label: string): number {
  return checksum(label) % 104;
}

/** Deterministic helper 5: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex5(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 5: exposes a stable checksum for the given label. */
export function labelChecksum5(label: string): number {
  return checksum(label) % 105;
}

/** Deterministic helper 6: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex6(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 6: exposes a stable checksum for the given label. */
export function labelChecksum6(label: string): number {
  return checksum(label) % 106;
}

/** Deterministic helper 7: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex7(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 7: exposes a stable checksum for the given label. */
export function labelChecksum7(label: string): number {
  return checksum(label) % 107;
}

/** Deterministic helper 8: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex8(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 8: exposes a stable checksum for the given label. */
export function labelChecksum8(label: string): number {
  return checksum(label) % 108;
}

/** Deterministic helper 9: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex9(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 9: exposes a stable checksum for the given label. */
export function labelChecksum9(label: string): number {
  return checksum(label) % 109;
}

/** Deterministic helper 10: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex10(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 10: exposes a stable checksum for the given label. */
export function labelChecksum10(label: string): number {
  return checksum(label) % 110;
}

/** Deterministic helper 11: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex11(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 11: exposes a stable checksum for the given label. */
export function labelChecksum11(label: string): number {
  return checksum(label) % 111;
}

/** Deterministic helper 12: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex12(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 12: exposes a stable checksum for the given label. */
export function labelChecksum12(label: string): number {
  return checksum(label) % 112;
}

/** Deterministic helper 13: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex13(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 13: exposes a stable checksum for the given label. */
export function labelChecksum13(label: string): number {
  return checksum(label) % 113;
}

/** Deterministic helper 14: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex14(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 14: exposes a stable checksum for the given label. */
export function labelChecksum14(label: string): number {
  return checksum(label) % 114;
}

/** Deterministic helper 15: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex15(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 15: exposes a stable checksum for the given label. */
export function labelChecksum15(label: string): number {
  return checksum(label) % 115;
}

/** Deterministic helper 16: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex16(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 16: exposes a stable checksum for the given label. */
export function labelChecksum16(label: string): number {
  return checksum(label) % 116;
}

/** Deterministic helper 17: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex17(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 17: exposes a stable checksum for the given label. */
export function labelChecksum17(label: string): number {
  return checksum(label) % 117;
}

/** Deterministic helper 18: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex18(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 18: exposes a stable checksum for the given label. */
export function labelChecksum18(label: string): number {
  return checksum(label) % 118;
}

/** Deterministic helper 19: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex19(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 19: exposes a stable checksum for the given label. */
export function labelChecksum19(label: string): number {
  return checksum(label) % 119;
}

/** Deterministic helper 20: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex20(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 20: exposes a stable checksum for the given label. */
export function labelChecksum20(label: string): number {
  return checksum(label) % 120;
}

/** Deterministic helper 21: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex21(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 21: exposes a stable checksum for the given label. */
export function labelChecksum21(label: string): number {
  return checksum(label) % 121;
}

/** Deterministic helper 22: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex22(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 22: exposes a stable checksum for the given label. */
export function labelChecksum22(label: string): number {
  return checksum(label) % 122;
}

/** Deterministic helper 23: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex23(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 23: exposes a stable checksum for the given label. */
export function labelChecksum23(label: string): number {
  return checksum(label) % 123;
}

/** Deterministic helper 24: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex24(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 24: exposes a stable checksum for the given label. */
export function labelChecksum24(label: string): number {
  return checksum(label) % 124;
}

/** Deterministic helper 25: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex25(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 25: exposes a stable checksum for the given label. */
export function labelChecksum25(label: string): number {
  return checksum(label) % 125;
}

/** Deterministic helper 26: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex26(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 26: exposes a stable checksum for the given label. */
export function labelChecksum26(label: string): number {
  return checksum(label) % 126;
}

/** Deterministic helper 27: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex27(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 27: exposes a stable checksum for the given label. */
export function labelChecksum27(label: string): number {
  return checksum(label) % 127;
}

/** Deterministic helper 28: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex28(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 28: exposes a stable checksum for the given label. */
export function labelChecksum28(label: string): number {
  return checksum(label) % 128;
}

/** Deterministic helper 29: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex29(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 29: exposes a stable checksum for the given label. */
export function labelChecksum29(label: string): number {
  return checksum(label) % 129;
}

/** Deterministic helper 30: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex30(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 30: exposes a stable checksum for the given label. */
export function labelChecksum30(label: string): number {
  return checksum(label) % 130;
}

/** Deterministic helper 31: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex31(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 31: exposes a stable checksum for the given label. */
export function labelChecksum31(label: string): number {
  return checksum(label) % 131;
}

/** Deterministic helper 32: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex32(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 32: exposes a stable checksum for the given label. */
export function labelChecksum32(label: string): number {
  return checksum(label) % 132;
}

/** Deterministic helper 33: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex33(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 33: exposes a stable checksum for the given label. */
export function labelChecksum33(label: string): number {
  return checksum(label) % 133;
}

/** Deterministic helper 34: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex34(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 34: exposes a stable checksum for the given label. */
export function labelChecksum34(label: string): number {
  return checksum(label) % 134;
}

/** Deterministic helper 35: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex35(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 35: exposes a stable checksum for the given label. */
export function labelChecksum35(label: string): number {
  return checksum(label) % 135;
}

/** Deterministic helper 36: normalises the tab index used by the demo launcher. */
export function normalizeTabIndex36(value: number): number {
  return clamp(value, 4);
}

/** Deterministic helper 36: exposes a stable checksum for the given label. */
export function labelChecksum36(label: string): number {
  return checksum(label) % 136;
}
