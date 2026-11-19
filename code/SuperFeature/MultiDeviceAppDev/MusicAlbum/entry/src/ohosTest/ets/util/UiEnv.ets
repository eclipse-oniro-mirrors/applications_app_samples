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

/**
 * UI helpers for the L2 suites.
 *
 * Rules kept here so that the suites stay free of raw coordinates:
 * - every lookup goes through ON.id() against the semantic ids added to
 *   entry/src/main/ets/common/*.ets;
 * - waiting is "poll + upper bound", never a long sleep;
 * - a missing component returns a snapshot string instead of throwing, so a
 *   suite can assert 'notfound' without crashing the batch.
 *
 * Snapshot grammar: 'ok[:detail]' | 'notfound' | 'error[:detail]'.
 */
import { Driver, ON, Component } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

export const BUNDLE_NAME: string = 'ohos.samples.MusicAlbum';
export const MAIN_ABILITY: string = 'MainAbility';
export const WAIT_MS: number = 3000;

export async function sleep(ms: number): Promise<void> {
  await new Promise<void>((resolve: (value: void) => void) => {
    setTimeout(() => {
      resolve();
    }, ms);
  });
}

export async function launchApp(): Promise<string> {
  try {
    const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
    await delegator.startAbility({
      bundleName: BUNDLE_NAME,
      abilityName: MAIN_ABILITY
    });
    await sleep(1500);
    return 'ok';
  } catch (err) {
    return 'error:launch';
  }
}

export async function unlockIfNeeded(): Promise<string> {
  try {
    // Driver.isLocked()/unlock() are not exposed on every SDK level, so the
    // helper only proves that a driver can be created; the launch helper then
    // retries until the header is on screen.
    const driver: Driver = await Driver.create();
    return driver === undefined || driver === null ? 'error:driver' : 'ok';
  } catch (err) {
    return 'error:unlock';
  }
}

export async function dismissDialogs(): Promise<void> {
  try {
    const driver: Driver = await Driver.create();
    const allow: Component = await driver.findComponent(ON.text('允许'));
    if (allow !== undefined && allow !== null) {
      await allow.click();
      await sleep(300);
    }
    const always: Component = await driver.findComponent(ON.text('始终允许'));
    if (always !== undefined && always !== null) {
      await always.click();
      await sleep(300);
    }
  } catch (err) {
    return;
  }
}

export async function existsId(id: string): Promise<boolean> {
  try {
    const driver: Driver = await Driver.create();
    const comp: Component = await driver.findComponent(ON.id(id));
    return !(comp === undefined || comp === null);
  } catch (err) {
    return false;
  }
}

export async function waitId(id: string, timeoutMs: number): Promise<boolean> {
  const deadline: number = Date.now() + timeoutMs;
  while (Date.now() < deadline) {
    if (await existsId(id)) {
      return true;
    }
    await sleep(200);
  }
  return false;
}

export async function countId(id: string): Promise<number> {
  try {
    const driver: Driver = await Driver.create();
    const list: Array<Component> = await driver.findComponents(ON.id(id));
    if (list === undefined || list === null) {
      return 0;
    }
    return list.length;
  } catch (err) {
    return -1;
  }
}

export async function clickId(id: string): Promise<string> {
  try {
    const driver: Driver = await Driver.create();
    const comp: Component = await driver.findComponent(ON.id(id));
    if (comp === undefined || comp === null) {
      return 'notfound';
    }
    await comp.click();
    await sleep(300);
    return 'ok';
  } catch (err) {
    return 'error:click';
  }
}

export async function textOfId(id: string): Promise<string> {
  try {
    const driver: Driver = await Driver.create();
    const comp: Component = await driver.findComponent(ON.id(id));
    if (comp === undefined || comp === null) {
      return 'notfound';
    }
    const text: string = await comp.getText();
    return 'ok:' + text;
  } catch (err) {
    return 'error:text';
  }
}

export async function typeOfId(id: string): Promise<string> {
  try {
    const driver: Driver = await Driver.create();
    const comp: Component = await driver.findComponent(ON.id(id));
    if (comp === undefined || comp === null) {
      return 'notfound';
    }
    const type: string = await comp.getType();
    return 'ok:' + type;
  } catch (err) {
    return 'error:type';
  }
}

export async function boundsOfId(id: string): Promise<string> {
  try {
    const driver: Driver = await Driver.create();
    const comp: Component = await driver.findComponent(ON.id(id));
    if (comp === undefined || comp === null) {
      return 'notfound';
    }
    const rect = await comp.getBounds();
    return 'ok:' + rect.left.toString() + ',' + rect.top.toString() + ',' +
      rect.right.toString() + ',' + rect.bottom.toString();
  } catch (err) {
    return 'error:bounds';
  }
}

export async function displaySize(): Promise<string> {
  try {
    const driver: Driver = await Driver.create();
    const point = await driver.getDisplaySize();
    if (point === undefined || point === null) {
      return 'notfound';
    }
    return 'ok:' + point.x.toString() + ',' + point.y.toString();
  } catch (err) {
    return 'error:display';
  }
}

export async function pressBack(): Promise<string> {
  try {
    const driver: Driver = await Driver.create();
    await driver.pressBack();
    await sleep(500);
    return 'ok';
  } catch (err) {
    return 'error:back';
  }
}

/** Bring the app back to a known state before every L2 case. */
export async function resetToHome(): Promise<void> {
  await dismissDialogs();
  await pressBack();
  await launchApp();
  await waitId('header_root', WAIT_MS);
}

/**
 * Frozen copy of entry/src/main/resources/base/element/string.json.
 *
 * The test HAP carries its own resource id table, so $r('app.string.xxx') taken
 * from a test file would resolve against the test module and not against the
 * strings the screen really shows. The table below is only a fallback: the
 * suite first asks the application resource manager by name, which follows the
 * system language exactly like the screen does.
 */
const FROZEN_TEXT: Map<string, string> = new Map<string, string>([
  ['play_list', '歌单'],
  ['list_name', '独立民谣'],
  ['playlist_Introduction', '歌单选取了一些比较受关注的民谣歌曲。'],
  ['download', '下载'],
  ['comment', '评论'],
  ['share', '分享'],
  ['play_all', '播放全部(104)'],
  ['collection_num', '12.5万'],
  ['song_name', '不知道'],
  ['singer', '小碗你好']
]);

/** Resolve a main-module string by resource name, falling back to the frozen table. */
export function expectedText(name: string): string {
  const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
  const context = delegator.getAppContext();
  try {
    return context.resourceManager.getStringByNameSync(name);
  } catch (err) {
    // the test HAP does not carry the main-module strings, use the frozen copy
  }
  const frozen: string | undefined = FROZEN_TEXT.get(name);
  return frozen === undefined ? 'unresolved' : frozen;
}

/** '<left>,<top>,<right>,<bottom>' of a component, or a 'notfound'/'error:x' marker. */
export async function geometryOfId(id: string): Promise<string> {
  try {
    const driver: Driver = await Driver.create();
    const comp: Component = await driver.findComponent(ON.id(id));
    if (comp === undefined || comp === null) {
      return 'notfound';
    }
    const rect = await comp.getBounds();
    return 'ok:' + rect.left.toString() + ',' + rect.top.toString() + ',' +
      rect.right.toString() + ',' + rect.bottom.toString();
  } catch (err) {
    return 'error:geometry';
  }
}

/** 'ok' when the centre of <upper> sits above the centre of <lower>. */
export async function aboveOfId(upper: string, lower: string): Promise<string> {
  const first: string = await geometryOfId(upper);
  const second: string = await geometryOfId(lower);
  if (!first.startsWith('ok:') || !second.startsWith('ok:')) {
    return 'notfound';
  }
  const firstParts: string[] = first.slice(3).split(',');
  const secondParts: string[] = second.slice(3).split(',');
  const firstCentre: number = (Number(firstParts[1]) + Number(firstParts[3])) / 2;
  const secondCentre: number = (Number(secondParts[1]) + Number(secondParts[3])) / 2;
  return firstCentre < secondCentre ? 'ok' : 'fail';
}

/** Number of ids in the comma separated list that are on screen, as a string. */
export async function countIds(ids: string): Promise<number> {
  const list: string[] = ids.split(',');
  let present: number = 0;
  for (let i = 0; i < list.length; i++) {
    if (await existsId(list[i])) {
      present++;
    }
  }
  return present;
}

/**
 * True when the song list itself is inside the viewport.
 *
 * On a compact (sm) window the cover column grows to the full band height, so
 * the playlist column is pushed past the bottom of the content band and the
 * List is no longer part of the accessibility tree. Suites branch on this
 * probe instead of assuming a single window size.
 */
export async function listInViewport(): Promise<boolean> {
  return existsId('song_list');
}

/** True when the playlist name/description column is not covered by the cover image. */
export async function introInViewport(): Promise<boolean> {
  return existsId('cover_list_name');
}

/** Swipe inside a container using its own bounds, never fixed coordinates. */
export async function swipeUpInId(id: string): Promise<string> {
  try {
    const driver: Driver = await Driver.create();
    const comp: Component = await driver.findComponent(ON.id(id));
    if (comp === undefined || comp === null) {
      return 'notfound';
    }
    const rect = await comp.getBounds();
    const centreX: number = (rect.left + rect.right) / 2;
    const startY: number = rect.top + (rect.bottom - rect.top) * 0.8;
    const endY: number = rect.top + (rect.bottom - rect.top) * 0.2;
    await driver.swipe(centreX, startY, centreX, endY, 600);
    await sleep(400);
    return 'ok';
  } catch (err) {
    return 'error:swipe';
  }
}
