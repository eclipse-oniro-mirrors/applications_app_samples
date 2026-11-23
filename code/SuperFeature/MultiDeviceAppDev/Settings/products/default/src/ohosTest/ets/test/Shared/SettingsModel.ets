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

export interface SettingsEntry {
  key: string;
  title: string;
  hasToggle: boolean;
  enabled: boolean;
}

export const SETTINGS_NAVBAR_RATIO: number = 0.4;
export const SETTINGS_ITEM_COUNT: number = 4;

export class SettingsModel {
  private entries: SettingsEntry[] = [];

  constructor() {
    this.entries.push({ key: 'wlan', title: 'WLAN', hasToggle: true, enabled: true });
    this.entries.push({ key: 'bluetooth', title: 'Bluetooth', hasToggle: true, enabled: false });
    this.entries.push({ key: 'mobileData', title: 'MobileData', hasToggle: true, enabled: false });
    this.entries.push({ key: 'moreConnections', title: 'MoreConnections', hasToggle: false, enabled: false });
  }

  public getItemCount(): number {
    return this.entries.length;
  }

  public getEntries(): SettingsEntry[] {
    return this.entries;
  }

  public getEntry(key: string): SettingsEntry | undefined {
    for (let i = 0; i < this.entries.length; i++) {
      if (key === this.entries[i].key) {
        return this.entries[i];
      }
    }
    return undefined;
  }

  public toggle(key: string): boolean {
    const entry = this.getEntry(key);
    if (entry === undefined || !entry.hasToggle) {
      return false;
    }
    entry.enabled = !entry.enabled;
    return true;
  }

  public isEnabled(key: string): boolean {
    const entry = this.getEntry(key);
    return entry === undefined ? false : entry.enabled;
  }

  public navbarWidth(windowWidth: number): number {
    return SETTINGS_NAVBAR_RATIO * windowWidth;
  }

  public isSplitMode(windowWidth: number): boolean {
    return windowWidth >= 600;
  }

  public getToggleCount(): number {
    let count = 0;
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].hasToggle) {
        count++;
      }
    }
    return count;
  }

  public getEnabledCount(): number {
    let count = 0;
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].enabled) {
        count++;
      }
    }
    return count;
  }

  public isToggleRejected(key: string): boolean {
    const entry = this.getEntry(key);
    if (entry === undefined) {
      return true;
    }
    if (entry.hasToggle) {
      return false;
    }
    const before = entry.enabled;
    this.toggle(key);
    return entry.enabled === before;
  }

  public hasUniqueKeys(): boolean {
    const seen = new Set<string>();
    for (let i = 0; i < this.entries.length; i++) {
      if (seen.has(this.entries[i].key)) {
        return false;
      }
      seen.add(this.entries[i].key);
    }
    return true;
  }
}
