/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Driver, ON, Component, UiWindow, abilityDelegatorRegistry } from '@kit.TestKit';
import { resourceManager } from '@kit.LocalizationKit';
import display from '@ohos.display';

export const BUNDLE_NAME: string = 'com.samples.audio';

export const BLANK_TEXT: string = '--';

export const TOTAL_SECOND: number = 30;

export const MIN_RECORD_SECOND: number = 5;

export const TIME_PATTERN: RegExp = /^\d{2}:\d{2}:\d{2}$/;

export const PAGE_TIMEOUT: number = 10000;

export const ANIMATION_SETTLE: number = 800;

export const RECORD_TICK: number = 1000;

export const HOME_ID: string = 'select_output_device_card';

// Foreground the app only as a last resort. Walking back with the system back key
// is preferred because relaunching can displace the test TestAbility and end the run.
export async function startEntryAbility(): Promise<void> {
  const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  await delegator.executeShellCommand(`aa start -b ${BUNDLE_NAME} -a EntryAbility`);
}

export const INDEX_CARD_IDS: string[] = [
  'select_output_device_card',
  'audio_focus_card',
  'audio_effect_manager_card',
  'audio_capturer_card',
  'audio_volume_card',
  'spatial_audio_card',
  'karaoke_card'
];

export const CONTENT_TYPES: string[] = [
  'CONTENT_TYPE_UNKNOWN',
  'CONTENT_TYPE_SPEECH',
  'CONTENT_TYPE_MUSIC',
  'CONTENT_TYPE_MOVIE',
  'CONTENT_TYPE_SONIFICATION',
  'CONTENT_TYPE_RINGTONE'
];

export const STREAM_USAGES: string[] = [
  'STREAM_USAGE_UNKNOWN',
  'STREAM_USAGE_MEDIA',
  'STREAM_USAGE_MUSIC',
  'STREAM_USAGE_VOICE_COMMUNICATION',
  'STREAM_USAGE_VOICE_ASSISTANT',
  'STREAM_USAGE_ALARM',
  'STREAM_USAGE_VOICE_MESSAGE',
  'STREAM_USAGE_NOTIFICATION_RINGTONE',
  'STREAM_USAGE_RINGTONE',
  'STREAM_USAGE_NOTIFICATION',
  'STREAM_USAGE_ACCESSIBILITY',
  'STREAM_USAGE_MOVIE',
  'STREAM_USAGE_GAME',
  'STREAM_USAGE_AUDIOBOOK',
  'STREAM_USAGE_NAVIGATION'
];

export enum CaptureMode {
  NORMAL = 0,
  LIVE = 1,
  PARALLEL = 2
}

export function stringsOf(keys: string[]): string[] {
  const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
  const resMgr: resourceManager.ResourceManager = context.resourceManager;
  return keys.map((key: string) => resMgr.getStringByNameSync(key));
}

export function labelOf(key: string): string {
  const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
  return context.resourceManager.getStringByNameSync(key);
}

export function parseSeconds(timeText: string): number {
  if (!TIME_PATTERN.test(timeText)) {
    return -1;
  }
  const parts: string[] = timeText.split(':');
  return Number(parts[0]) * 3600 + Number(parts[1]) * 60 + Number(parts[2]);
}

export function isSortedByLength(texts: string[]): boolean {
  for (let i = 1; i < texts.length; i++) {
    if (texts[i].length < texts[i - 1].length) {
      return false;
    }
  }
  return true;
}

export function uniqueCount(values: string[]): number {
  const seen: string[] = [];
  values.forEach((value: string) => {
    if (!seen.includes(value)) {
      seen.push(value);
    }
  });
  return seen.length;
}

// The test runner shares one process with the app under test, so force-stopping
// the bundle would kill the runner itself. Prefer walking back to home first and
// only restart the entry ability when the app window is really gone.
export async function relaunchToHome(driver: Driver): Promise<boolean> {
  await startEntryAbility();
  await driver.delayMs(800);
  const home: Component | null = await driver.waitForComponent(ON.id(HOME_ID), PAGE_TIMEOUT);
  return home !== null;
}

export const BACK_IDS: string[] = [
  'back_btn_focus', 'back_btn', 'back_btn_preset', 'back_btn_realtime',
  'normal_capturer_back_btn', 'spatial_audio_back_btn', 'karaoke_back_btn'
];

// UiTest can only see the page tree of the ability that currently owns the top
// window. The TestAbility sits under it, and UiTest does not fall through to the
// app window on its own, so the home page must become the top ability first.
export async function bringHomeToFront(driver: Driver): Promise<boolean> {
  await startEntryAbility();
  await driver.delayMs(ANIMATION_SETTLE);
  // A cold start lands on the home page; a warm start resumes whatever page was
  // left on the router stack. Use the system back key instead of the bar by id.
  for (let i = 0; i < 8; i++) {
    if (await exists(driver, HOME_ID, 1000)) {
      return true;
    }
    try {
      await driver.pressBack();
    } catch (err) {
      return false;
    }
    await driver.delayMs(ANIMATION_SETTLE);
  }
  return await exists(driver, HOME_ID, 1000);
}

export async function backToHomeIfNeeded(driver: Driver, backId: string): Promise<boolean> {
  if (await exists(driver, HOME_ID, 500)) {
    return true;
  }
  return await bringHomeToFront(driver);
}

// The sample requests MICROPHONE on launch, so a freshly installed bundle always
// shows the permission dialog before the home page loads.
export async function grantMicIfNeeded(driver: Driver): Promise<void> {
  const labels: string[] = [
    '允许', '允许使用', '仅在使用中允许', '使用时允许', '仅使用期间允许', '始终允许', 'Allow', '同意'
  ];
  // The permission dialog is a separate window; focus it so UiTest can inspect
  // its children before falling back to a coordinate click.
  let win: UiWindow | null = null;
  try {
    win = await driver.findWindow({ bundleName: 'com.ohos.permissionmanager' });
  } catch (err) {
    win = null;
  }
  if (win !== null) {
    try {
      await win.focus();
    } catch (err) {
    }
    await driver.delayMs(200);
  }
  for (const label of labels) {
    let allow: Component | null = null;
    try {
      allow = await driver.findComponent(ON.text(label));
    } catch (err) {
      allow = null;
    }
    if (allow !== null) {
      try {
        await allow.click();
      } catch (err) {
      }
      await driver.delayMs(400);
      return;
    }
  }
  if (win !== null) {
    try {
      const rect = await win.getBounds();
      const btnX: number = Math.round(rect.left + (rect.right - rect.left) * 0.72);
      const btnY: number = Math.round(rect.top + (rect.bottom - rect.top) * 0.6);
      await driver.click(btnX, btnY);
      await driver.delayMs(400);
    } catch (err) {
    }
  }
}

export async function ensureHomeReady(driver: Driver): Promise<boolean> {
  if (await exists(driver, HOME_ID, 400)) {
    return true;
  }
  // The home page is a Scroll: after a swipe the top card can be off-screen while
  // the other entry cards are still visible. Treat that as "on home" and scroll
  // back to the top instead of restarting the ability.
  let onScrolledHome: boolean = false;
  for (const cardId of INDEX_CARD_IDS) {
    if (cardId !== HOME_ID && await exists(driver, cardId, 300)) {
      onScrolledHome = true;
      break;
    }
  }
  if (onScrolledHome) {
    try {
      const screen = display.getDefaultDisplaySync();
      for (let i = 0; i < 3; i++) {
        if (await exists(driver, HOME_ID, 300)) {
          return true;
        }
        await driver.swipe(Math.round(screen.width / 2), Math.round(screen.height * 0.35),
          Math.round(screen.width / 2), Math.round(screen.height * 0.75), 600);
        await driver.delayMs(400);
      }
    } catch (err) {
    }
    if (await exists(driver, HOME_ID, 600)) {
      return true;
    }
  }
  await startEntryAbility();
  // Wait for home or the microphone dialog; the dialog appears before loadContent.
  for (let i = 0; i < 12; i++) {
    if (await exists(driver, HOME_ID, 200)) {
      return true;
    }
    let perm: UiWindow | null = null;
    try {
      perm = await driver.findWindow({ bundleName: 'com.ohos.permissionmanager' });
    } catch (err) {
    }
    if (perm !== null) {
      await grantMicIfNeeded(driver);
    }
    await driver.delayMs(400);
  }
  // A warm start may have resumed a sub-page; walk back with the system back key.
  for (let i = 0; i < 8; i++) {
    try {
      await driver.pressBack();
    } catch (err) {
      break;
    }
    await driver.delayMs(500);
    if (await exists(driver, HOME_ID, 600)) {
      return true;
    }
  }
  return false;
}

export async function tapBackToHome(driver: Driver, backId: string): Promise<boolean> {
  // The Navigation back arrow is a system-drawn icon; it exposes neither the
  // '返回' text nor a clickable child, so use the system back key instead of
  // clicking the Navigation container by id.
  if (await exists(driver, HOME_ID, 500)) {
    return true;
  }
  for (let i = 0; i < 4; i++) {
    try {
      await driver.pressBack();
    } catch (err) {
      return false;
    }
    await driver.delayMs(ANIMATION_SETTLE);
    if (await exists(driver, HOME_ID, 1500)) {
      return true;
    }
  }
  return false;
}

export async function tapId(driver: Driver, id: string, settle: number = ANIMATION_SETTLE): Promise<boolean> {
  let target: Component | null = await driver.waitForComponent(ON.id(id), 4000);
  if (target === null) {
    // The home page is a Scroll; lower cards may be below the fold. Scroll once
    // and retry before giving up so those entries stay reachable.
    try {
      const screen = display.getDefaultDisplaySync();
      await driver.swipe(Math.round(screen.width / 2), Math.round(screen.height * 0.75),
        Math.round(screen.width / 2), Math.round(screen.height * 0.35), 600);
      await driver.delayMs(600);
    } catch (err) {
    }
    target = await driver.waitForComponent(ON.id(id), 4000);
  }
  if (target === null) {
    return false;
  }
  await target.click();
  if (settle > 0) {
    await driver.delayMs(settle);
  }
  return true;
}

export async function exists(driver: Driver, id: string, timeout: number = 1000): Promise<boolean> {
  const target: Component | null = await driver.waitForComponent(ON.id(id), timeout);
  return target !== null;
}

export async function existsInWindow(driver: Driver, id: string): Promise<boolean> {
  try {
    const target: Component | null = await driver.findComponent(ON.id(id));
    if (target !== null) {
      return true;
    }
  } catch (err) {
  }
  try {
    const win = await driver.findWindow({ bundleName: BUNDLE_NAME });
    if (win === null) {
      return false;
    }
    await win.focus();
    await driver.delayMs(300);
  } catch (err) {
    return false;
  }
  return await exists(driver, id, 2000);
}

export async function existsText(driver: Driver, text: string, timeout: number = 1000): Promise<boolean> {
  const target: Component | null = await driver.waitForComponent(ON.text(text), timeout);
  return target !== null;
}

export async function getIdText(driver: Driver, id: string): Promise<string | null> {
  const target: Component | null = await driver.waitForComponent(ON.id(id), 3000);
  if (target === null) {
    return null;
  }
  return target.getText();
}

// Some texts sit inside a container that carries the id, so they are not the
// first text node of that subtree; the visible text is then only exposed by
// walking the child components.
export async function getSubtreeText(driver: Driver, id: string): Promise<string | null> {
  const target: Component | null = await driver.waitForComponent(ON.id(id), 3000);
  if (target === null) {
    return null;
  }
  const own: string = await target.getText();
  if (own.length > 0) {
    return own;
  }
  // Selector containers carry the id, while the visible label is a child Text
  // that exposes a companion id (<containerId>_text).
  const inner: Component | null = await driver.findComponent(ON.id(id + '_text'));
  return inner === null ? own : await inner.getText();
}

export async function openFromHome(driver: Driver, cardId: string, markerId: string): Promise<boolean> {
  if (!(await ensureHomeReady(driver))) {
    return false;
  }
  const home: Component | null = await driver.waitForComponent(ON.id(HOME_ID), PAGE_TIMEOUT);
  if (home === null) {
    return false;
  }
  if (!(await tapId(driver, cardId))) {
    return false;
  }
  const marker: Component | null = await driver.waitForComponent(ON.id(markerId), PAGE_TIMEOUT);
  return marker !== null;
}

export function tabIdOf(mode: CaptureMode): string {
  if (mode === CaptureMode.NORMAL) {
    return 'btn_normal_capturer';
  }
  if (mode === CaptureMode.LIVE) {
    return 'btn_live_capturer';
  }
  return 'btn_parallel_capturer';
}

// The capturer entry always lands on the normal tab, so every mode switch goes
// through the shared tab bar; a page-level router replace happens per tab.
export async function openCapturePage(driver: Driver, mode: CaptureMode): Promise<boolean> {
  const opened: boolean = await openFromHome(driver, 'audio_capturer_card', 'btn_normal_capturer');
  if (!opened) {
    return false;
  }
  if (mode === CaptureMode.NORMAL) {
    return true;
  }
  if (!(await tapId(driver, tabIdOf(mode), 1500))) {
    return false;
  }
  return await exists(driver, startButtonOf(mode), PAGE_TIMEOUT);
}

export function startButtonOf(mode: CaptureMode): string {
  if (mode === CaptureMode.NORMAL) {
    return 'normal_start_record_btn';
  }
  if (mode === CaptureMode.LIVE) {
    return 'live_start_record_btn';
  }
  return 'parallel_start_btn';
}

export function prefixOf(mode: CaptureMode): string {
  if (mode === CaptureMode.NORMAL) {
    return 'normal_';
  }
  if (mode === CaptureMode.LIVE) {
    return 'live_';
  }
  return 'parallel_';
}

export async function recordForSeconds(driver: Driver, seconds: number): Promise<void> {
  for (let i = 0; i < seconds; i++) {
    await driver.delayMs(RECORD_TICK);
  }
}
