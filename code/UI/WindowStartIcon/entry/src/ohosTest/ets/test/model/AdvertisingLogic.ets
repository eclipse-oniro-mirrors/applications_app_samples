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

// Countdown and window logic of pages/AdvertisingPage.ets plus the start window settings of module.json5 /
// color.json; the 1 s interval is replaced by explicit ticks.

// Mirrors @State pageCountDown: number = 6 and the 1000 ms interval.
export const PAGE_COUNT_DOWN: number = 6;
export const INTERVAL_MS: number = 1000;
// Mirrors router.replaceUrl({ url: 'pages/Index' }) and the pages of main_pages.json.
export const INDEX_PAGE: string = 'pages/Index';
export const ADVERTISING_PAGE: string = 'pages/AdvertisingPage';
export const MAIN_PAGES: string[] = ['pages/Index', 'pages/AdvertisingPage'];
// Mirrors startWindowIcon / startWindowBackground of module.json5 and color.json.
export const START_WINDOW_ICON: string = '$media:icon_startwindow';
export const START_WINDOW_BACKGROUND: string = '#FFFFFF';

// Mirrors pageCountDown after a number of interval ticks (never below 0 because the timer stops at 0).
export function remainingAfter(ticks: number, initial: number): number {
  if (ticks <= 0) {
    return initial;
  }
  const left: number = initial - Math.floor(ticks);
  return left > 0 ? left : 0;
}

// Mirrors if (this.pageCountDown === 0): the tick that triggers the replaceUrl().
export function navigatesAtTick(tick: number, initial: number): boolean {
  return Number.isInteger(tick) && tick === initial && initial > 0;
}

// Mirrors the elapsed advertising time when the page leaves after the countdown.
export function elapsedMsOf(ticks: number): number {
  return ticks > 0 ? Math.floor(ticks) * INTERVAL_MS : 0;
}

// Mirrors Text(`${this.pageCountDown}`) of countdownText.
export function countdownTextOf(count: number): string {
  return `${count}`;
}

// Mirrors onPageShow() -> changeFullScreen(true) and the leave paths -> changeFullScreen(false).
export function fullScreenFor(event: string): boolean {
  return event === 'show';
}

// Mirrors the page that EntryAbility loads first.
export function firstPageOf(): string {
  return ADVERTISING_PAGE;
}

// Mirrors main_pages.json: whether a route is registered.
export function isRegisteredPage(page: string): boolean {
  return MAIN_PAGES.indexOf(page) >= 0;
}

// Mirrors the #RRGGBB format of startWindowBackground.
export function isHexColor(color: string): boolean {
  return /^#[0-9A-Fa-f]{6}([0-9A-Fa-f]{2})?$/.test(color);
}

// Mirrors one 8-bit channel (0 red, 1 green, 2 blue) of a #RRGGBB color.
export function colorChannelOf(color: string, channel: number): number {
  if (!isHexColor(color) || !Number.isInteger(channel) || channel < 0 || channel > 2) {
    return -1;
  }
  const offset: number = color.length === 9 ? 3 : 1;
  return parseInt(color.substring(offset + channel * 2, offset + channel * 2 + 2), 16);
}

// Mirrors the AdvertisingPage countdown: interval ticks, skip button and the final navigation.
export class AdvertisingState {
  pageCountDown: number = PAGE_COUNT_DOWN;
  timerRunning: boolean = false;
  isFullScreen: boolean = false;
  navigatedTo: string = '';
  ticks: number = 0;

  // Mirrors onPageShow(): immersive mode on and the interval started.
  show(): boolean {
    this.isFullScreen = true;
    this.timerRunning = true;
    return this.isFullScreen;
  }

  // Mirrors one setInterval() callback.
  tick(): number {
    if (!this.timerRunning) {
      return this.pageCountDown;
    }
    this.ticks++;
    this.pageCountDown--;
    if (this.pageCountDown === 0) {
      this.leave();
    }
    return this.pageCountDown;
  }

  // Mirrors the skip button onClick(): countdown to 0, timer cleared, replaceUrl and immersive mode off.
  skip(): string {
    this.pageCountDown = 0;
    this.leave();
    return this.navigatedTo;
  }

  // Mirrors the shared leave path: clearInterval(), changeFullScreen(false), router.replaceUrl().
  leave(): void {
    this.timerRunning = false;
    this.isFullScreen = false;
    this.navigatedTo = INDEX_PAGE;
  }

  // Mirrors the countdown text.
  text(): string {
    return countdownTextOf(this.pageCountDown);
  }
}
