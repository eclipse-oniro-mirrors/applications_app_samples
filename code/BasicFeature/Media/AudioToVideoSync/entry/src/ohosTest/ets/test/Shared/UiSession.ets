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

import { abilityDelegatorRegistry, Driver, ON, Component } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import { delay } from './TestPace';

export const APP_BUNDLE: string = 'com.samples.AudioToVideoSync';
export const APP_ABILITY: string = 'EntryAbility';
export const APP_TITLE: string = '音画同步示例';
export const PLAY_TEXT: string = '播放';
export const PLAYING_TEXT: string = '播放中';
export const SPEED_TEXTS: string[] = ['x1', 'x2', 'x3'];

let sharedDriver: Driver | null = null;

// UiTest allows one driver per process; suites share it instead of calling Driver.create again.
export function uiDriver(): Driver {
  if (sharedDriver === null) {
    sharedDriver = Driver.create();
  }
  return sharedDriver;
}

async function ensureDriver(): Promise<Driver> {
  for (let attempt = 0; attempt < 6; attempt++) {
    try {
      const candidate: Driver = uiDriver();
      if (candidate !== null && candidate !== undefined) {
        return candidate;
      }
    } catch (error) {
      console.info(`ensureDriver attempt ${attempt} failed`);
    }
    await delay(800);
  }
  throw new Error('UiTest driver unavailable');
}

export async function waitForText(target: Driver, text: string, timeoutMs: number = 8000): Promise<Component> {
  return target.waitForComponent(ON.text(text), timeoutMs);
}

export async function openApp(): Promise<Driver> {
  const delegator: abilityDelegatorRegistry.AbilityDelegator =
    abilityDelegatorRegistry.getAbilityDelegator();
  const want: Want = { bundleName: APP_BUNDLE, abilityName: APP_ABILITY };
  const target: Driver = await ensureDriver();
  for (let attempt = 0; attempt < 4; attempt++) {
    try {
      await delegator.startAbility(want);
      const title: Component = await target.waitForComponent(ON.text(APP_TITLE), 6000);
      if (title !== null && title !== undefined) {
        await target.delayMs(400);
        return target;
      }
    } catch (error) {
      console.info(`openApp attempt ${attempt} failed`);
    }
    await target.delayMs(1200);
  }
  try {
    await delegator.startAbility(want);
  } catch (error) {
    console.info('openApp final start failed');
  }
  return target;
}

export async function findTextOrNull(target: Driver, text: string): Promise<Component | null> {
  const found: Component | null = await target.findComponent(ON.text(text));
  return found;
}

export async function countText(target: Driver, text: string): Promise<number> {
  const found: Component[] = await target.findComponents(ON.text(text));
  return found.length;
}

export async function backToApp(target: Driver, maxSteps: number = 3): Promise<boolean> {
  for (let i = 0; i < maxSteps; i++) {
    if ((await findTextOrNull(target, APP_TITLE)) !== null) {
      return true;
    }
    await target.pressBack();
    await target.delayMs(500);
  }
  return (await findTextOrNull(target, APP_TITLE)) !== null;
}
