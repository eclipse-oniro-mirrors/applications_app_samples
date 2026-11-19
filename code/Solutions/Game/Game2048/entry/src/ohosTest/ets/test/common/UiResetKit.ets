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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import application from '@ohos.app.ability.application';
import common from '@ohos.app.ability.common';
import data_preferences from '@ohos.data.preferences';

const BUNDLE_NAME: string = 'ohos.samples.game2048';
const ABILITY_NAME: string = 'EntryAbility';
const STORE_NAME: string = 'mystore';
const LOGO_ID: string = 'logo2048';
const LAUNCH_WAIT: number = 1200;
const CLOSE_WAIT: number = 800;

/** Clears the three game keys so a relaunched page starts in the BEFORE state. */
export async function clearGameStore(): Promise<void> {
  let context: common.Context = application.getApplicationContext();
  let store: data_preferences.Preferences = await data_preferences.getPreferences(context, STORE_NAME);
  await store.delete('gameData');
  await store.delete('score');
  await store.delete('gameStatus');
  await store.flush();
}

/** Presses back only when the game page is actually on screen. */
export async function closeGamePageIfPresent(driver: Driver): Promise<void> {
  try {
    let logo: Component = await driver.findComponent(ON.id(LOGO_ID));
    if (logo !== null && logo !== undefined) {
      await driver.pressBack();
      await driver.delayMs(CLOSE_WAIT);
    }
  } catch (error) {
  }
}

/** Tells whether the Start button is currently on screen. */
async function hasStart(driver: Driver): Promise<boolean> {
  try {
    let start: Component = await driver.findComponent(ON.id('startGame'));
    return start !== null && start !== undefined;
  } catch (error) {
    return false;
  }
}

/**
 * Brings the sample to the foreground, closes any live instance, clears the
 * saved game and launches a fresh page. The loop retries because a back plus
 * relaunch can race with the ability manager on slower devices.
 */
export async function resetToBeforePage(driver: Driver): Promise<void> {
  let delegator: AbilityDelegatorRegistry.AbilityDelegator =
    AbilityDelegatorRegistry.getAbilityDelegator();
  for (let attempt: number = 0; attempt < 3; attempt++) {
    await clearGameStore();
    await delegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
    for (let poll: number = 0; poll < 8; poll++) {
      await driver.delayMs(500);
      if (await hasStart(driver)) {
        return;
      }
    }
    // The page is up but still RUNNING/OVER: close it so the next start
    // recreates the page and re-reads the freshly cleared preferences.
    await closeGamePageIfPresent(driver);
    await driver.delayMs(CLOSE_WAIT);
  }
}
