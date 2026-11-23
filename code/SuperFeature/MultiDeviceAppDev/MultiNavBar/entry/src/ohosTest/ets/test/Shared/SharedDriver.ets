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

import { Driver, ON, Component, ResizeDirection } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import hilog from '@ohos.hilog';
import { TARGET_BUNDLE, TARGET_ABILITY } from './ProjectConfig';

const DOMAIN: number = 0xF811;
const TAG: string = '[NavApp_Shared]';

let _driver: Driver | null = null;
let _uiQueue: Promise<void> = Promise.resolve();

export const WIDTH_XS: number = 280;

export const WIDTH_SM: number = 480;

export const WIDTH_MD: number = 720;

export const WIDTH_LG: number = 1000;

export const TIMEOUT_RENDER: number = 1500;

export const TIMEOUT_NAVIGATION: number = 2000;

export const DELAY_RESIZE: number = 600;

export const DELAY_NAV: number = 500;

export const DELAY_TOUCH: number = 200;

export const DELAY_LAUNCH: number = 1500;

export const TOLERANCE_COUNT: number = 3;

export const TOLERANCE_PX: number = 8;

export const STABLE_ROUNDS: number = 3;

export const STRESS_ROUNDS: number = 12;

export async function runSerialized<T>(action: () => Promise<T>): Promise<T> {
  const previous = _uiQueue;
  return await new Promise<T>((resolve, reject) => {
    _uiQueue = previous.then(async () => {
      try {
        resolve(await action());
      } catch (err) {
        reject(err instanceof Error ? err : new Error(String(err)));
      }
    }).catch((err: Error) => {
      reject(err);
    });
  });
}

export async function sdelay(driver: Driver, ms: number): Promise<void> {
  await runSerialized(async () => {
    await driver.delayMs(ms);
  });
}

export function getDriver(): Driver {
  if (_driver === null) {
    _driver = Driver.create();
  }
  return _driver;
}

export function resetDriver(): void {
  _uiQueue = Promise.resolve();
}

export async function launchApp(): Promise<boolean> {
  try {
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    const want: Want = { bundleName: TARGET_BUNDLE, abilityName: TARGET_ABILITY };
    await delegator.startAbility(want);
    hilog.info(DOMAIN, TAG, '%{public}s', 'launchApp succeeded');
    return true;
  } catch (err) {
    hilog.error(DOMAIN, TAG, 'launchApp failed: %{public}s', JSON.stringify(err) ?? '');
    return false;
  }
}

export async function terminateApp(): Promise<boolean> {
  try {
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    const top = await delegator.getCurrentTopAbility();
    await top.context.terminateSelf();
    hilog.info(DOMAIN, TAG, '%{public}s', 'terminateApp succeeded');
    return true;
  } catch (err) {
    hilog.error(DOMAIN, TAG, 'terminateApp failed: %{public}s', JSON.stringify(err) ?? '');
    return false;
  }
}

export async function resizeWindow(driver: Driver, targetWidthPx: number): Promise<boolean> {
  try {
    return await runSerialized(async () => {
      const win = await driver.findWindow({ actived: true });
      if (!win) {
        hilog.error(DOMAIN, TAG, '%{public}s', 'resizeWindow: window not found');
        return false;
      }
      const bounds = await win.getBounds();
      const height = bounds.bottom - bounds.top;
      await win.resize(targetWidthPx, height, ResizeDirection.LEFT);
      hilog.info(DOMAIN, TAG, 'resizeWindow: width=%{public}d', targetWidthPx);
      return true;
    });
  } catch (err) {
    hilog.error(DOMAIN, TAG, 'resizeWindow failed: %{public}s', JSON.stringify(err) ?? '');
    return false;
  }
}

export async function switchWidth(driver: Driver, widthPx: number): Promise<boolean> {
  const ok = await resizeWindow(driver, widthPx);
  if (!ok) {
    return false;
  }
  await sdelay(driver, DELAY_RESIZE);
  return true;
}

export async function currentWindowWidth(driver: Driver): Promise<number> {
  try {
    return await runSerialized(async () => {
      const win = await driver.findWindow({ actived: true });
      if (!win) {
        return -1;
      }
      const bounds = await win.getBounds();
      return bounds.right - bounds.left;
    });
  } catch (err) {
    hilog.error(DOMAIN, TAG, 'currentWindowWidth failed: %{public}s', JSON.stringify(err) ?? '');
    return -1;
  }
}

export function resolveBreakpoint(widthVp: number): string {
  if (widthVp < 0) {
    return 'unknown';
  } else if (widthVp < 320) {
    return 'xs';
  } else if (widthVp < 600) {
    return 'sm';
  } else if (widthVp < 840) {
    return 'md';
  }
  return 'lg';
}

export async function componentCount(driver: Driver): Promise<number> {
  try {
    return await runSerialized(async () => {
      const all = await driver.findComponents(ON.type('*'));
      const count = all ? all.length : 0;
      hilog.info(DOMAIN, TAG, 'componentCount: %{public}d', count);
      if (count > 0) {
        return count;
      }
      const texts = await driver.findComponents(ON.type('Text'));
      const images = await driver.findComponents(ON.type('Image'));
      const buttons = await driver.findComponents(ON.type('Button'));
      const lists = await driver.findComponents(ON.type('List'));
      const fallback = Math.max(
        texts ? texts.length : 0,
        images ? images.length : 0,
        buttons ? buttons.length : 0,
        lists ? lists.length : 0
      );
      hilog.info(DOMAIN, TAG, 'componentCount fallback: %{public}d', fallback);
      return fallback;
    });
  } catch (err) {
    hilog.error(DOMAIN, TAG, 'componentCount failed: %{public}s', JSON.stringify(err) ?? '');
    return 0;
  }
}

export async function findByType(driver: Driver, type: string): Promise<Component[]> {
  try {
    return await runSerialized(async () => {
      const list = await driver.findComponents(ON.type(type));
      return list ?? [];
    });
  } catch (err) {
    hilog.info(DOMAIN, TAG, 'findByType failed: %{public}s type=%{public}s',
      JSON.stringify(err) ?? '', type);
    return [];
  }
}

export async function findById(driver: Driver, id: string): Promise<Component | null> {
  try {
    return await runSerialized(async () => {
      return await driver.findComponent(ON.id(id));
    });
  } catch (err) {
    hilog.info(DOMAIN, TAG, 'findById miss: %{public}s id=%{public}s',
      JSON.stringify(err) ?? '', id);
    return null;
  }
}

export async function existsById(driver: Driver, id: string): Promise<boolean> {
  const c = await findById(driver, id);
  return c !== null && c !== undefined;
}

export async function clickId(driver: Driver, id: string): Promise<boolean> {
  try {
    return await runSerialized(async () => {
      const c = await driver.findComponent(ON.id(id));
      if (!c) {
        return false;
      }
      await c.click();
      await driver.delayMs(DELAY_TOUCH);
      return true;
    });
  } catch (err) {
    hilog.info(DOMAIN, TAG, 'clickId failed: %{public}s id=%{public}s',
      JSON.stringify(err) ?? '', id);
    return false;
  }
}

export async function clickText(driver: Driver, text: string): Promise<boolean> {
  try {
    return await runSerialized(async () => {
      const c = await driver.findComponent(ON.text(text));
      if (!c) {
        return false;
      }
      await c.click();
      await driver.delayMs(DELAY_TOUCH);
      return true;
    });
  } catch (err) {
    hilog.info(DOMAIN, TAG, 'clickText failed: %{public}s text=%{public}s',
      JSON.stringify(err) ?? '', text);
    return false;
  }
}

export async function textExists(driver: Driver, expected: string): Promise<boolean> {
  try {
    return await runSerialized(async () => {
      const texts = await driver.findComponents(ON.type('Text')) ?? [];
      for (const t of texts) {
        try {
          const content = await t.getText();
          if (content === expected) {
            return true;
          }
        } catch (e) {
          
        }
      }
      return false;
    });
  } catch (err) {
    hilog.error(DOMAIN, TAG, 'textExists failed: %{public}s', JSON.stringify(err) ?? '');
    return false;
  }
}

export async function boundsOf(driver: Driver, id: string): Promise<number[]> {
  try {
    return await runSerialized(async () => {
      const c = await driver.findComponent(ON.id(id));
      if (!c) {
        return [0, 0, 0, 0];
      }
      const b = await c.getBounds();
      return [b.left, b.top, b.right, b.bottom];
    });
  } catch (err) {
    hilog.info(DOMAIN, TAG, 'boundsOf failed: %{public}s id=%{public}s',
      JSON.stringify(err) ?? '', id);
    return [0, 0, 0, 0];
  }
}

export async function widthOf(driver: Driver, id: string): Promise<number> {
  const b = await boundsOf(driver, id);
  return b[2] - b[0];
}

export async function heightOf(driver: Driver, id: string): Promise<number> {
  const b = await boundsOf(driver, id);
  return b[3] - b[1];
}

export async function touchAt(driver: Driver, x: number, y: number): Promise<void> {
  await runSerialized(async () => {
    await driver.click(x, y);
    await driver.delayMs(DELAY_TOUCH);
  });
}

export async function backAndWait(driver: Driver): Promise<void> {
  await runSerialized(async () => {
    await driver.pressBack();
    await driver.delayMs(DELAY_NAV);
  });
}

export async function waitText(driver: Driver, text: string, maxWaitMs: number = TIMEOUT_RENDER): Promise<boolean> {
  const deadline = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    if (await textExists(driver, text)) {
      return true;
    }
    await sdelay(driver, 100);
  }
  hilog.info(DOMAIN, TAG, 'waitText timeout: %{public}s', text);
  return false;
}

export async function waitCount(driver: Driver, min: number, maxWaitMs: number = TIMEOUT_RENDER): Promise<boolean> {
  const deadline = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    if (await componentCount(driver) >= min) {
      return true;
    }
    await sdelay(driver, 100);
  }
  return false;
}

export async function sampleCount(driver: Driver, rounds: number = STABLE_ROUNDS,
  intervalMs: number = 200): Promise<number[]> {
  const samples: number[] = [];
  for (let i = 0; i < rounds; i++) {
    samples.push(await componentCount(driver));
    await sdelay(driver, intervalMs);
  }
  return samples;
}

export function rangeOf(samples: number[]): number {
  if (samples.length === 0) {
    return 0;
  }
  let lo = samples[0];
  let hi = samples[0];
  for (let i = 1; i < samples.length; i++) {
    lo = samples[i] < lo ? samples[i] : lo;
    hi = samples[i] > hi ? samples[i] : hi;
  }
  return hi - lo;
}

export function averageOf(samples: number[]): number {
  if (samples.length === 0) {
    return 0;
  }
  let sum = 0;
  for (let i = 0; i < samples.length; i++) {
    sum += samples[i];
  }
  return sum / samples.length;
}

export function safeDivide(a: number, b: number): number {
  return b === 0 ? 0 : a / b;
}

export async function waitIdle(driver: Driver, maxWaitMs: number = TIMEOUT_RENDER): Promise<boolean> {
  const deadline = Date.now() + maxWaitMs;
  let previous = -1;
  while (Date.now() < deadline) {
    const current = await componentCount(driver);
    if (previous >= 0 && current === previous) {
      return true;
    }
    previous = current;
    await sdelay(driver, 150);
  }
  return false;
}

export async function swipeOnce(driver: Driver, x1: number, y1: number, x2: number, y2: number,
  durationMs: number = 300): Promise<void> {
  await runSerialized(async () => {
    await driver.swipe(x1, y1, x2, y2, durationMs);
    await driver.delayMs(DELAY_TOUCH);
  });
}
