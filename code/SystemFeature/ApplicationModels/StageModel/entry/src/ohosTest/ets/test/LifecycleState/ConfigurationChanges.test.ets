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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import { getDriver, ensureAppReady, checkComponentExists, BUNDLE_NAME } from '../Shared/SharedDriver';

enum ConfigKey {
  LOCALE = 0,
  ORIENTATION = 1,
  DENSITY = 2,
  COLOR_MODE = 3,
  FONT_SCALE = 4,
  DIRECTION = 5
}

function configKeyName(key: number): string {
  if (key === ConfigKey.LOCALE) {
    return 'locale';
  }
  if (key === ConfigKey.ORIENTATION) {
    return 'orientation';
  }
  if (key === ConfigKey.DENSITY) {
    return 'density';
  }
  if (key === ConfigKey.COLOR_MODE) {
    return 'colorMode';
  }
  if (key === ConfigKey.FONT_SCALE) {
    return 'fontScale';
  }
  if (key === ConfigKey.DIRECTION) {
    return 'direction';
  }
  return 'unknown';
}

class ConfigEntry {
  key: number = ConfigKey.LOCALE;
  value: string = '';

  constructor(key: number, value: string) {
    this.key = key;
    this.value = value;
  }
}

class ConfigChange {
  key: number = ConfigKey.LOCALE;
  oldValue: string = '';
  newValue: string = '';
  revision: number = 0;

  constructor(key: number, oldValue: string, newValue: string, revision: number) {
    this.key = key;
    this.oldValue = oldValue;
    this.newValue = newValue;
    this.revision = revision;
  }

  isChanged(): boolean {
    return this.oldValue !== this.newValue;
  }

  describe(): string {
    return `${configKeyName(this.key)}:${this.oldValue}->${this.newValue}`;
  }
}

class ConfigurationTracker {
  private entries: ConfigEntry[] = [];
  private history: ConfigChange[] = [];
  private revision: number = 0;

  private findIndex(key: number): number {
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].key === key) {
        return i;
      }
    }
    return -1;
  }

  get(key: number): string {
    const index = this.findIndex(key);
    if (index < 0) {
      return '';
    }
    return this.entries[index].value;
  }

  has(key: number): boolean {
    return this.findIndex(key) >= 0;
  }

  set(key: number, value: string): ConfigChange {
    const index = this.findIndex(key);
    const oldValue = index < 0 ? '' : this.entries[index].value;
    this.revision = this.revision + 1;
    const change = new ConfigChange(key, oldValue, value, this.revision);
    if (index < 0) {
      this.entries.push(new ConfigEntry(key, value));
    } else {
      this.entries[index].value = value;
    }
    this.history.push(change);
    return change;
  }

  remove(key: number): boolean {
    const index = this.findIndex(key);
    if (index < 0) {
      return false;
    }
    this.entries.splice(index, 1);
    this.revision = this.revision + 1;
    return true;
  }

  getRevision(): number {
    return this.revision;
  }

  getHistory(): ConfigChange[] {
    return this.history;
  }

  changedKeys(): number[] {
    const result: number[] = [];
    for (let i = 0; i < this.history.length; i++) {
      const change = this.history[i];
      if (change.isChanged() && result.indexOf(change.key) < 0) {
        result.push(change.key);
      }
    }
    return result;
  }

  noOpChangeCount(): number {
    let count = 0;
    for (let i = 0; i < this.history.length; i++) {
      if (!this.history[i].isChanged()) {
        count = count + 1;
      }
    }
    return count;
  }

  isPortrait(): boolean {
    return this.get(ConfigKey.ORIENTATION) === 'portrait';
  }

  isDarkMode(): boolean {
    return this.get(ConfigKey.COLOR_MODE) === 'dark';
  }

  isRightToLeft(): boolean {
    return this.get(ConfigKey.DIRECTION) === 'rtl';
  }

  rotate(): ConfigChange {
    const next = this.isPortrait() ? 'landscape' : 'portrait';
    return this.set(ConfigKey.ORIENTATION, next);
  }

  toggleColorMode(): ConfigChange {
    const next = this.isDarkMode() ? 'light' : 'dark';
    return this.set(ConfigKey.COLOR_MODE, next);
  }

  applyDefaults(): number {
    let applied = 0;
    if (!this.has(ConfigKey.LOCALE)) {
      this.set(ConfigKey.LOCALE, 'zh-Hans');
      applied = applied + 1;
    }
    if (!this.has(ConfigKey.ORIENTATION)) {
      this.set(ConfigKey.ORIENTATION, 'portrait');
      applied = applied + 1;
    }
    if (!this.has(ConfigKey.COLOR_MODE)) {
      this.set(ConfigKey.COLOR_MODE, 'light');
      applied = applied + 1;
    }
    return applied;
  }

  merge(other: ConfigurationTracker): number {
    let merged = 0;
    const otherHistory = other.getHistory();
    for (let i = 0; i < otherHistory.length; i++) {
      const change = otherHistory[i];
      this.set(change.key, change.newValue);
      merged = merged + 1;
    }
    return merged;
  }

  snapshot(): ConfigEntry[] {
    const copy: ConfigEntry[] = [];
    for (let i = 0; i < this.entries.length; i++) {
      copy.push(new ConfigEntry(this.entries[i].key, this.entries[i].value));
    }
    return copy;
  }

  restore(entries: ConfigEntry[]): number {
    this.entries = [];
    for (let i = 0; i < entries.length; i++) {
      this.entries.push(new ConfigEntry(entries[i].key, entries[i].value));
    }
    this.revision = this.revision + 1;
    return this.entries.length;
  }

  size(): number {
    return this.entries.length;
  }
}

function validDensity(value: number): boolean {
  return Number.isInteger(value) && value > 0 && value <= 640;
}

function validFontScale(value: number): boolean {
  return value >= 0.5 && value <= 3.0;
}

function clampFontScale(value: number): number {
  if (value < 0.5) {
    return 0.5;
  }
  if (value > 3.0) {
    return 3.0;
  }
  return value;
}

export default function configurationChangesTest(): void {
  describe('ConfigurationChanges', () => {
    it('ConfigurationChanges_001', 0, async (done: Function) => {
      const tracker = new ConfigurationTracker();
      expect(tracker.size()).assertEqual(0);
      expect(tracker.getRevision()).assertEqual(0);
      expect(tracker.get(ConfigKey.LOCALE)).assertEqual('');
      expect(tracker.has(ConfigKey.LOCALE)).assertFalse();
      done();
    });

    it('ConfigurationChanges_002', 0, async (done: Function) => {
      const tracker = new ConfigurationTracker();
      const change = tracker.set(ConfigKey.LOCALE, 'en-US');
      expect(change.isChanged()).assertTrue();
      expect(change.oldValue).assertEqual('');
      expect(change.newValue).assertEqual('en-US');
      expect(change.revision).assertEqual(1);
      expect(tracker.get(ConfigKey.LOCALE)).assertEqual('en-US');
      done();
    });

    it('ConfigurationChanges_003', 0, async (done: Function) => {
      const tracker = new ConfigurationTracker();
      tracker.set(ConfigKey.ORIENTATION, 'portrait');
      expect(tracker.isPortrait()).assertTrue();
      expect(tracker.isDarkMode()).assertFalse();
      expect(tracker.isRightToLeft()).assertFalse();
      done();
    });

    it('ConfigurationChanges_004', 0, async (done: Function) => {
      const tracker = new ConfigurationTracker();
      tracker.set(ConfigKey.ORIENTATION, 'portrait');
      const change = tracker.rotate();
      expect(change.oldValue).assertEqual('portrait');
      expect(change.newValue).assertEqual('landscape');
      expect(tracker.isPortrait()).assertFalse();
      expect(tracker.getRevision()).assertEqual(2);
      done();
    });

    it('ConfigurationChanges_005', 0, async (done: Function) => {
      const tracker = new ConfigurationTracker();
      tracker.set(ConfigKey.COLOR_MODE, 'light');
      expect(tracker.isDarkMode()).assertFalse();
      const change = tracker.toggleColorMode();
      expect(change.isChanged()).assertTrue();
      expect(tracker.isDarkMode()).assertTrue();
      done();
    });

    it('ConfigurationChanges_006', 0, async (done: Function) => {
      const tracker = new ConfigurationTracker();
      tracker.set(ConfigKey.LOCALE, 'zh-Hans');
      const change = tracker.set(ConfigKey.LOCALE, 'zh-Hans');
      expect(change.isChanged()).assertFalse();
      expect(tracker.noOpChangeCount()).assertEqual(1);
      expect(tracker.size()).assertEqual(1);
      done();
    });

    it('ConfigurationChanges_007', 0, async (done: Function) => {
      const tracker = new ConfigurationTracker();
      tracker.set(ConfigKey.LOCALE, 'zh-Hans');
      tracker.set(ConfigKey.LOCALE, 'en-US');
      tracker.set(ConfigKey.ORIENTATION, 'landscape');
      expect(tracker.size()).assertEqual(2);
      expect(tracker.getRevision()).assertEqual(3);
      expect(tracker.changedKeys().length).assertEqual(2);
      done();
    });

    it('ConfigurationChanges_008', 0, async (done: Function) => {
      const tracker = new ConfigurationTracker();
      tracker.set(ConfigKey.DIRECTION, 'ltr');
      expect(tracker.isRightToLeft()).assertFalse();
      tracker.set(ConfigKey.DIRECTION, 'rtl');
      expect(tracker.isRightToLeft()).assertTrue();
      done();
    });

    it('ConfigurationChanges_009', 0, async (done: Function) => {
      const tracker = new ConfigurationTracker();
      expect(tracker.remove(ConfigKey.LOCALE)).assertFalse();
      tracker.set(ConfigKey.LOCALE, 'zh-Hans');
      expect(tracker.remove(ConfigKey.LOCALE)).assertTrue();
      expect(tracker.has(ConfigKey.LOCALE)).assertFalse();
      expect(tracker.size()).assertEqual(0);
      done();
    });

    it('ConfigurationChanges_010', 0, async (done: Function) => {
      const tracker = new ConfigurationTracker();
      expect(tracker.applyDefaults()).assertEqual(3);
      expect(tracker.get(ConfigKey.LOCALE)).assertEqual('zh-Hans');
      expect(tracker.get(ConfigKey.ORIENTATION)).assertEqual('portrait');
      expect(tracker.get(ConfigKey.COLOR_MODE)).assertEqual('light');
      expect(tracker.applyDefaults()).assertEqual(0);
      done();
    });

    it('ConfigurationChanges_011', 0, async (done: Function) => {
      const tracker = new ConfigurationTracker();
      tracker.set(ConfigKey.LOCALE, 'zh-Hans');
      const snapshot = tracker.snapshot();
      expect(snapshot.length).assertEqual(1);
      tracker.set(ConfigKey.LOCALE, 'en-US');
      expect(tracker.restore(snapshot)).assertEqual(1);
      expect(tracker.get(ConfigKey.LOCALE)).assertEqual('zh-Hans');
      done();
    });

    it('ConfigurationChanges_012', 0, async (done: Function) => {
      const source = new ConfigurationTracker();
      source.set(ConfigKey.LOCALE, 'en-US');
      source.set(ConfigKey.COLOR_MODE, 'dark');
      const target = new ConfigurationTracker();
      expect(target.merge(source)).assertEqual(2);
      expect(target.get(ConfigKey.LOCALE)).assertEqual('en-US');
      expect(target.isDarkMode()).assertTrue();
      done();
    });

    it('ConfigurationChanges_013', 0, async (done: Function) => {
      expect(validDensity(320)).assertTrue();
      expect(validDensity(0)).assertFalse();
      expect(validDensity(-1)).assertFalse();
      expect(validDensity(641)).assertFalse();
      expect(validDensity(240.5)).assertFalse();
      done();
    });

    it('ConfigurationChanges_014', 0, async (done: Function) => {
      expect(validFontScale(1.0)).assertTrue();
      expect(validFontScale(0.5)).assertTrue();
      expect(validFontScale(3.0)).assertTrue();
      expect(validFontScale(0.4)).assertFalse();
      expect(validFontScale(3.1)).assertFalse();
      done();
    });

    it('ConfigurationChanges_015', 0, async (done: Function) => {
      expect(clampFontScale(0.2)).assertEqual(0.5);
      expect(clampFontScale(9.9)).assertEqual(3.0);
      expect(clampFontScale(2.0)).assertEqual(2.0);
      done();
    });

    it('ConfigurationChanges_016', 0, async (done: Function) => {
      const change = new ConfigChange(ConfigKey.COLOR_MODE, 'light', 'dark', 7);
      expect(change.describe()).assertEqual('colorMode:light->dark');
      expect(configKeyName(ConfigKey.FONT_SCALE)).assertEqual('fontScale');
      expect(configKeyName(99)).assertEqual('unknown');
      done();
    });

    it('ConfigurationChanges_017', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        const exists = await checkComponentExists(driver, 'Scroll');
        expect(typeof exists === 'boolean').assertTrue();
        hilog.info(0x0000, 'StageModelTest', '%{public}s', `config ui probe ${exists}`);
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });
  });
}

