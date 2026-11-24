/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect } from '@ohos/hypium';
import { Component, Driver, ON } from '@ohos.UiTest';
import registry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';

const POLL_MS: number = 100;
const FEED_ID: string = 'short_video_feed';
const COMPONENT_TIMEOUT_MS: number = 5000;
const PLAYBACK_TIMEOUT_MS: number = 8000;
let sharedDriver: Driver | undefined;
let uiQueue: Promise<void> = Promise.resolve();

export function getDriver(): Driver {
  const driver = sharedDriver ?? Driver.create();
  sharedDriver = driver;
  return driver;
}

// Serialize entire scenarios rather than individual calls; a caller owns the UI between awaits.
export function runSerializedUiOperation<T>(action: () => Promise<T>): Promise<T> {
  const operation = uiQueue.then(action);
  uiQueue = operation.then((): void => {}, (): void => {});
  return operation;
}

export async function launchShortVideoApp(): Promise<void> {
  const want: Want = {
    bundleName: registry.getArguments().bundleName,
    moduleName: 'entry',
    abilityName: 'EntryAbility'
  };
  await registry.getAbilityDelegator().startAbility(want);
}

export function parsePlaybackClock(text: string): number {
  const fields = text.split(':');
  if (fields.length !== 2 && fields.length !== 3) {
    return -1;
  }
  let total = 0;
  for (let i = 0; i < fields.length; i++) {
    const field = fields[i];
    if (((i > 0 || fields.length === 2) && field.length !== 2) || field.length < 2) {
      return -1;
    }
    for (let digit = 0; digit < field.length; digit++) {
      const code = field.charCodeAt(digit);
      if (code < 48 || code > 57) {
        return -1;
      }
    }
    const value = Number(field);
    if (!Number.isSafeInteger(value) || ((i > 0 || fields.length === 2) && value >= 60)) {
      return -1;
    }
    total = total * 60 + value;
  }
  return Number.isSafeInteger(total) ? total : -1;
}

export class FeedDriver {
  private driver: Driver = getDriver();

  async launch(): Promise<void> {
    await launchShortVideoApp();
    await this.requireComponent(FEED_ID);
  }

  async requireComponent(id: string): Promise<Component> {
    const component = await this.driver.waitForComponent(ON.id(id), COMPONENT_TIMEOUT_MS);
    if (!component) {
      throw new Error(`Component not found: ${id}`);
    }
    return component;
  }

  private async waitFor(label: string, timeout: number, predicate: () => Promise<boolean>): Promise<void> {
    const deadline = Date.now() + timeout;
    do {
      if (await predicate()) {
        return;
      }
      await this.driver.delayMs(POLL_MS);
    } while (Date.now() < deadline);
    throw new Error(`Timed out waiting for ${label}`);
  }

  async activeIndex(count: number): Promise<number> {
    let active = -1;
    for (let index = 0; index < count; index++) {
      const matches = (await this.driver.findComponents(ON.id(`short_video_active_${index}`))) ?? [];
      if (matches.length > 0) {
        if (active !== -1 || matches.length > 1) {
          return -1;
        }
        active = index;
      }
    }
    return active;
  }

  async waitForIndex(index: number): Promise<void> {
    await this.requireComponent(`short_video_active_${index}`);
  }

  async swipe(next: boolean, speed: number = 1500): Promise<void> {
    const feed = await this.requireComponent(FEED_ID);
    const bounds = await feed.getBounds();
    const x = Math.floor(bounds.left + (bounds.right - bounds.left) * 0.5);
    const height = bounds.bottom - bounds.top;
    if (height < 100 || bounds.right - bounds.left < 100) {
      throw new Error('The feed viewport is too small for swipe injection');
    }
    const top = Math.floor(bounds.top + height * 0.08);
    const bottom = Math.floor(bounds.top + height * 0.92);
    await this.driver.swipe(x, next ? bottom : top, x, next ? top : bottom, speed);
  }

  async tapVideo(): Promise<void> {
    const feed = await this.requireComponent(FEED_ID);
    const bounds = await feed.getBounds();
    await this.driver.click(Math.floor((bounds.left + bounds.right) / 2),
      Math.floor(bounds.top + (bounds.bottom - bounds.top) * 0.35));
  }

  async tapSeek(index: number, fraction: number): Promise<void> {
    const slider = await this.requireComponent(`short_video_slider_${index}`);
    const bounds = await slider.getBounds();
    const x = Math.floor(bounds.left + fraction * (bounds.right - bounds.left));
    const y = Math.floor((bounds.top + bounds.bottom) / 2);
    await this.driver.click(x, y);
  }

  async waitForPauseIndicator(index: number, visible: boolean): Promise<void> {
    await this.waitFor(`pause indicator ${index}: ${visible}`, COMPONENT_TIMEOUT_MS, async (): Promise<boolean> => {
      const nodes = (await this.driver.findComponents(ON.id(`short_video_pause_${index}`))) ?? [];
      return (nodes.length > 0) === visible;
    });
  }

  async readClock(index: number, duration: boolean = false): Promise<number> {
    const key = duration ? 'duration' : 'time';
    const nodes = (await this.driver.findComponents(ON.id(`short_video_${key}_${index}`))) ?? [];
    if (nodes.length !== 1) {
      return -1;
    }
    return parsePlaybackClock(await nodes[0].getText());
  }

  async waitForPlayback(index: number): Promise<void> {
    let first = -1;
    await this.waitFor(`video ${index} clock to advance`, PLAYBACK_TIMEOUT_MS, async (): Promise<boolean> => {
      const time = await this.readClock(index);
      if (time < 0) {
        return false;
      }
      if (first < 0) {
        first = time;
      }
      return time > first;
    });
  }

  async waitForPausedClock(index: number): Promise<number> {
    let previous = -1;
    let unchangedSince = Date.now();
    await this.waitFor(`video ${index} clock to stay still`, COMPONENT_TIMEOUT_MS, async (): Promise<boolean> => {
      const time = await this.readClock(index);
      if (time < 0 || time !== previous) {
        previous = time;
        unchangedSince = Date.now();
      }
      return time >= 0 && Date.now() - unchangedSince >= 1200;
    });
    return previous;
  }

  async waitForSeek(index: number, previous: number, expected: number, tolerance: number): Promise<number> {
    let actual = -1;
    await this.waitFor(`video ${index} seek near ${expected}`, PLAYBACK_TIMEOUT_MS, async (): Promise<boolean> => {
      actual = await this.readClock(index);
      return actual >= 0 && actual !== previous && Math.abs(actual - expected) <= tolerance;
    });
    return actual;
  }

  async sendHome(): Promise<void> {
    await this.driver.pressHome();
  }

  async waitForFeedHidden(): Promise<void> {
    await this.waitFor('demo window to be hidden', COMPONENT_TIMEOUT_MS, async (): Promise<boolean> => {
      const matches = (await this.driver.findComponents(ON.id(FEED_ID))) ?? [];
      return matches.length === 0;
    });
  }
}

export default function driverContractTest(): void {
  describe('ShortVideoDriverClock', (): void => {
    it('clockOracle_001', 0, (): void => {
      const actual = parsePlaybackClock("");
      expect(actual).assertEqual(-1);
    });

    it('clockOracle_002', 0, (): void => {
      const actual = parsePlaybackClock("0:00");
      expect(actual).assertEqual(-1);
    });

    it('clockOracle_003', 0, (): void => {
      const actual = parsePlaybackClock("00:0");
      expect(actual).assertEqual(-1);
    });

    it('clockOracle_004', 0, (): void => {
      const actual = parsePlaybackClock("00:00:0");
      expect(actual).assertEqual(-1);
    });

    it('clockOracle_005', 0, (): void => {
      const actual = parsePlaybackClock("00::00");
      expect(actual).assertEqual(-1);
    });

    it('clockOracle_006', 0, (): void => {
      const actual = parsePlaybackClock("0x01:00");
      expect(actual).assertEqual(-1);
    });

    it('clockOracle_007', 0, (): void => {
      const actual = parsePlaybackClock("+1:00");
      expect(actual).assertEqual(-1);
    });

    it('clockOracle_008', 0, (): void => {
      const actual = parsePlaybackClock("01:-1");
      expect(actual).assertEqual(-1);
    });

    it('clockOracle_009', 0, (): void => {
      const actual = parsePlaybackClock("01: 0");
      expect(actual).assertEqual(-1);
    });

    it('clockOracle_010', 0, (): void => {
      const actual = parsePlaybackClock("60:00");
      expect(actual).assertEqual(-1);
    });

    it('clockOracle_011', 0, (): void => {
      const actual = parsePlaybackClock("00:60");
      expect(actual).assertEqual(-1);
    });

    it('clockOracle_012', 0, (): void => {
      const actual = parsePlaybackClock("01:60:00");
      expect(actual).assertEqual(-1);
    });

    it('clockOracle_013', 0, (): void => {
      const actual = parsePlaybackClock("00:00:60");
      expect(actual).assertEqual(-1);
    });

    it('clockOracle_014', 0, (): void => {
      const actual = parsePlaybackClock("01:01:01:01");
      expect(actual).assertEqual(-1);
    });

    it('clockOracle_015', 0, (): void => {
      const actual = parsePlaybackClock("9007199254740991:00:00");
      expect(actual).assertEqual(-1);
    });

    it('clockOracle_016', 0, (): void => {
      const actual = parsePlaybackClock("00:０１");
      expect(actual).assertEqual(-1);
    });

    it('clockOracle_017', 0, (): void => {
      const actual = parsePlaybackClock("00:00");
      expect(actual).assertEqual(0);
    });

    it('clockOracle_018', 0, (): void => {
      const actual = parsePlaybackClock("00:01");
      expect(actual).assertEqual(1);
    });

    it('clockOracle_019', 0, (): void => {
      const actual = parsePlaybackClock("00:09");
      expect(actual).assertEqual(9);
    });

    it('clockOracle_020', 0, (): void => {
      const actual = parsePlaybackClock("00:10");
      expect(actual).assertEqual(10);
    });

    it('clockOracle_021', 0, (): void => {
      const actual = parsePlaybackClock("00:58");
      expect(actual).assertEqual(58);
    });

    it('clockOracle_022', 0, (): void => {
      const actual = parsePlaybackClock("00:59");
      expect(actual).assertEqual(59);
    });

    it('clockOracle_023', 0, (): void => {
      const actual = parsePlaybackClock("01:00");
      expect(actual).assertEqual(60);
    });

    it('clockOracle_024', 0, (): void => {
      const actual = parsePlaybackClock("01:01");
      expect(actual).assertEqual(61);
    });

    it('clockOracle_025', 0, (): void => {
      const actual = parsePlaybackClock("01:09");
      expect(actual).assertEqual(69);
    });

    it('clockOracle_026', 0, (): void => {
      const actual = parsePlaybackClock("01:10");
      expect(actual).assertEqual(70);
    });

    it('clockOracle_027', 0, (): void => {
      const actual = parsePlaybackClock("01:58");
      expect(actual).assertEqual(118);
    });

    it('clockOracle_028', 0, (): void => {
      const actual = parsePlaybackClock("01:59");
      expect(actual).assertEqual(119);
    });

    it('clockOracle_029', 0, (): void => {
      const actual = parsePlaybackClock("09:00");
      expect(actual).assertEqual(540);
    });

    it('clockOracle_030', 0, (): void => {
      const actual = parsePlaybackClock("09:01");
      expect(actual).assertEqual(541);
    });

    it('clockOracle_031', 0, (): void => {
      const actual = parsePlaybackClock("09:09");
      expect(actual).assertEqual(549);
    });

    it('clockOracle_032', 0, (): void => {
      const actual = parsePlaybackClock("09:10");
      expect(actual).assertEqual(550);
    });

    it('clockOracle_033', 0, (): void => {
      const actual = parsePlaybackClock("09:58");
      expect(actual).assertEqual(598);
    });

    it('clockOracle_034', 0, (): void => {
      const actual = parsePlaybackClock("09:59");
      expect(actual).assertEqual(599);
    });

    it('clockOracle_035', 0, (): void => {
      const actual = parsePlaybackClock("10:00");
      expect(actual).assertEqual(600);
    });

    it('clockOracle_036', 0, (): void => {
      const actual = parsePlaybackClock("10:01");
      expect(actual).assertEqual(601);
    });

    it('clockOracle_037', 0, (): void => {
      const actual = parsePlaybackClock("10:09");
      expect(actual).assertEqual(609);
    });

    it('clockOracle_038', 0, (): void => {
      const actual = parsePlaybackClock("10:10");
      expect(actual).assertEqual(610);
    });

    it('clockOracle_039', 0, (): void => {
      const actual = parsePlaybackClock("10:58");
      expect(actual).assertEqual(658);
    });

    it('clockOracle_040', 0, (): void => {
      const actual = parsePlaybackClock("10:59");
      expect(actual).assertEqual(659);
    });

    it('clockOracle_041', 0, (): void => {
      const actual = parsePlaybackClock("30:00");
      expect(actual).assertEqual(1800);
    });

    it('clockOracle_042', 0, (): void => {
      const actual = parsePlaybackClock("30:01");
      expect(actual).assertEqual(1801);
    });

    it('clockOracle_043', 0, (): void => {
      const actual = parsePlaybackClock("30:09");
      expect(actual).assertEqual(1809);
    });

    it('clockOracle_044', 0, (): void => {
      const actual = parsePlaybackClock("30:10");
      expect(actual).assertEqual(1810);
    });

    it('clockOracle_045', 0, (): void => {
      const actual = parsePlaybackClock("30:58");
      expect(actual).assertEqual(1858);
    });

    it('clockOracle_046', 0, (): void => {
      const actual = parsePlaybackClock("30:59");
      expect(actual).assertEqual(1859);
    });

    it('clockOracle_047', 0, (): void => {
      const actual = parsePlaybackClock("58:00");
      expect(actual).assertEqual(3480);
    });

    it('clockOracle_048', 0, (): void => {
      const actual = parsePlaybackClock("58:01");
      expect(actual).assertEqual(3481);
    });

    it('clockOracle_049', 0, (): void => {
      const actual = parsePlaybackClock("58:09");
      expect(actual).assertEqual(3489);
    });

    it('clockOracle_050', 0, (): void => {
      const actual = parsePlaybackClock("58:10");
      expect(actual).assertEqual(3490);
    });

    it('clockOracle_051', 0, (): void => {
      const actual = parsePlaybackClock("58:58");
      expect(actual).assertEqual(3538);
    });

    it('clockOracle_052', 0, (): void => {
      const actual = parsePlaybackClock("58:59");
      expect(actual).assertEqual(3539);
    });

  });
}
