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

export interface SettingsGroup {
  key: string;
  items: string[];
}

export interface SettingsWifiNetwork {
  name: string;
  secured: boolean;
  connected: boolean;
  signal: number;
  summary: string;
}

/**
 * Group layout of features/settingitems/.../SettingList.ets.
 */
export const SETTINGS_GROUP_KEYS: string[] = ['connections', 'display', 'sound', 'security', 'system'];

export const SETTINGS_GROUP_SIZES: number[] = [4, 1, 1, 5, 3];

export const SETTINGS_CONNECTIONS_ITEMS: string[] =
  ['wlan', 'bluetooth', 'mobileData', 'moreConnections'];

export const SETTINGS_DISPLAY_ITEMS: string[] = ['brightness'];

export const SETTINGS_SOUND_ITEMS: string[] = ['volume'];

export const SETTINGS_SECURITY_ITEMS: string[] =
  ['biometricsPassword', 'application', 'storage', 'security', 'privacy'];

export const SETTINGS_SYSTEM_ITEMS: string[] = ['usersAccounts', 'systemUpdate', 'aboutDevice'];

/**
 * Networks rendered by wlan/WlanSettingItem.ets together with their summaries.
 */
export const SETTINGS_WIFI_NAMES: string[] = ['UX', 'Huwe-yee', 'UX-5G', 'E1-AP'];

export const SETTINGS_WIFI_SUMMARIES: string[] = ['connected', 'encrypted', 'open', 'saveOpen'];

export const SETTINGS_WIFI_SIGNALS: number[] = [4, 4, 4, 4];

export const SETTINGS_WIFI_SECURED: boolean[] = [false, true, false, false];

export const SETTINGS_WIFI_CONNECTED: boolean[] = [true, false, false, false];

export class SettingsCatalogModel {
  private groups: SettingsGroup[] = [];

  constructor() {
    this.groups.push({ key: SETTINGS_GROUP_KEYS[0], items: SETTINGS_CONNECTIONS_ITEMS.slice(0) });
    this.groups.push({ key: SETTINGS_GROUP_KEYS[1], items: SETTINGS_DISPLAY_ITEMS.slice(0) });
    this.groups.push({ key: SETTINGS_GROUP_KEYS[2], items: SETTINGS_SOUND_ITEMS.slice(0) });
    this.groups.push({ key: SETTINGS_GROUP_KEYS[3], items: SETTINGS_SECURITY_ITEMS.slice(0) });
    this.groups.push({ key: SETTINGS_GROUP_KEYS[4], items: SETTINGS_SYSTEM_ITEMS.slice(0) });
  }

  public groupCount(): number {
    return this.groups.length;
  }

  public groupKeys(): string[] {
    return SETTINGS_GROUP_KEYS;
  }

  public groupSize(index: number): number {
    if (index < 0 || index >= this.groups.length) {
      return -1;
    }
    return this.groups[index].items.length;
  }

  public itemsOf(index: number): string[] {
    if (index < 0 || index >= this.groups.length) {
      return [];
    }
    return this.groups[index].items;
  }

  public itemCount(): number {
    let total: number = 0;
    for (let i = 0; i < this.groups.length; i++) {
      total += this.groups[i].items.length;
    }
    return total;
  }

  public globalItemAt(position: number): string {
    if (position < 0 || position >= this.itemCount()) {
      return '';
    }
    let seen: number = 0;
    for (let i = 0; i < this.groups.length; i++) {
      const size: number = this.groups[i].items.length;
      if (position < seen + size) {
        return this.groups[i].items[position - seen];
      }
      seen += size;
    }
    return '';
  }

  public groupIndexOfKey(key: string): number {
    for (let i = 0; i < this.groups.length; i++) {
      if (this.groups[i].key === key) {
        return i;
      }
    }
    return -1;
  }

  public containsItem(key: string): boolean {
    for (let i = 0; i < this.groups.length; i++) {
      if (this.groups[i].items.indexOf(key) >= 0) {
        return true;
      }
    }
    return false;
  }

  public largestGroupIndex(): number {
    let best: number = 0;
    for (let i = 1; i < this.groups.length; i++) {
      if (this.groups[i].items.length > this.groups[best].items.length) {
        best = i;
      }
    }
    return best;
  }

  public smallestGroupIndex(): number {
    let best: number = 0;
    for (let i = 1; i < this.groups.length; i++) {
      if (this.groups[i].items.length < this.groups[best].items.length) {
        best = i;
      }
    }
    return best;
  }

  public groupsWithSize(size: number): number {
    let count: number = 0;
    for (let i = 0; i < this.groups.length; i++) {
      if (this.groups[i].items.length === size) {
        count++;
      }
    }
    return count;
  }

  public hasUniqueItems(): boolean {
    const seen: Set<string> = new Set<string>();
    for (let i = 0; i < this.groups.length; i++) {
      for (let j = 0; j < this.groups[i].items.length; j++) {
        if (seen.has(this.groups[i].items[j])) {
          return false;
        }
        seen.add(this.groups[i].items[j]);
      }
    }
    return true;
  }

  public wifiCount(): number {
    return SETTINGS_WIFI_NAMES.length;
  }

  public wifiNameAt(index: number): string {
    if (index < 0 || index >= SETTINGS_WIFI_NAMES.length) {
      return '';
    }
    return SETTINGS_WIFI_NAMES[index];
  }

  public wifiSummaryAt(index: number): string {
    if (index < 0 || index >= SETTINGS_WIFI_SUMMARIES.length) {
      return '';
    }
    return SETTINGS_WIFI_SUMMARIES[index];
  }

  public securedWifiCount(): number {
    let count: number = 0;
    for (let i = 0; i < SETTINGS_WIFI_SECURED.length; i++) {
      if (SETTINGS_WIFI_SECURED[i]) {
        count++;
      }
    }
    return count;
  }

  public openWifiCount(): number {
    return this.wifiCount() - this.securedWifiCount();
  }

  public connectedWifiIndex(): number {
    for (let i = 0; i < SETTINGS_WIFI_CONNECTED.length; i++) {
      if (SETTINGS_WIFI_CONNECTED[i]) {
        return i;
      }
    }
    return -1;
  }

  public strongestSignalCount(): number {
    let best: number = 0;
    for (let i = 0; i < SETTINGS_WIFI_SIGNALS.length; i++) {
      best = SETTINGS_WIFI_SIGNALS[i] > best ? SETTINGS_WIFI_SIGNALS[i] : best;
    }
    let count: number = 0;
    for (let i = 0; i < SETTINGS_WIFI_SIGNALS.length; i++) {
      if (SETTINGS_WIFI_SIGNALS[i] === best) {
        count++;
      }
    }
    return count;
  }

  public hasUniqueWifiNames(): boolean {
    const seen: Set<string> = new Set<string>();
    for (let i = 0; i < SETTINGS_WIFI_NAMES.length; i++) {
      if (seen.has(SETTINGS_WIFI_NAMES[i])) {
        return false;
      }
      seen.add(SETTINGS_WIFI_NAMES[i]);
    }
    return true;
  }

  /**
   * WLAN toggle is created with isOn true, the NFC toggle keeps the component
   * default because no isOn value is passed.
   */
  public toggleDefault(name: string): boolean {
    return name === 'wlan';
  }

  public search(prefix: string): string[] {
    const result: string[] = [];
    for (let i = 0; i < this.groups.length; i++) {
      for (let j = 0; j < this.groups[i].items.length; j++) {
        if (this.groups[i].items[j].indexOf(prefix) === 0) {
          result.push(this.groups[i].items[j]);
        }
      }
    }
    return result;
  }
}
