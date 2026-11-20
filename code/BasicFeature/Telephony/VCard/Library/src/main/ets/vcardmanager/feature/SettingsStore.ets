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

import { common } from '@kit.AbilityKit';
import { preferences } from '@kit.ArkData';
import { VCardSettings } from '../model/VCardTypes';
import { VCardConstants } from '../common/VCardConstants';
import { Logger } from '../utils/Logger';

const KEY_VERSION: string = 'defaultVersion';
const KEY_CHARSET: string = 'defaultCharset';
const KEY_AUTO_JUMP: string = 'autoJumpToContacts';
const KEY_HISTORY_LIMIT: string = 'historyLimit';
const VERSION_COUNT: number = 3;
const HISTORY_LIMIT_MIN: number = 5;

export class SettingsStore {
  static async load(context: common.Context): Promise<VCardSettings> {
    const settings: VCardSettings = new VCardSettings();
    try {
      const store: preferences.Preferences = await preferences.getPreferences(context,
        { name: VCardConstants.PREFERENCE_SETTINGS });
      settings.defaultVersion = SettingsStore.toVersion(await store.get(KEY_VERSION, settings.defaultVersion));
      settings.defaultCharset = SettingsStore.toCharset(await store.get(KEY_CHARSET, settings.defaultCharset));
      settings.autoJumpToContacts = SettingsStore.toBoolean(await store.get(KEY_AUTO_JUMP,
        settings.autoJumpToContacts));
      settings.historyLimit = SettingsStore.toHistoryLimit(await store.get(KEY_HISTORY_LIMIT, settings.historyLimit));
    } catch (error) {
      const message: string = error instanceof Error ? error.message : '';
      Logger.error('[SettingsStore] load failed: ' + message);
      return new VCardSettings();
    }
    return settings;
  }

  static async save(context: common.Context, settings: VCardSettings): Promise<void> {
    const store: preferences.Preferences = await preferences.getPreferences(context,
      { name: VCardConstants.PREFERENCE_SETTINGS });
    await store.put(KEY_VERSION, SettingsStore.toVersion(settings.defaultVersion));
    await store.put(KEY_CHARSET, SettingsStore.toCharset(settings.defaultCharset));
    await store.put(KEY_AUTO_JUMP, SettingsStore.toBoolean(settings.autoJumpToContacts));
    await store.put(KEY_HISTORY_LIMIT, SettingsStore.toHistoryLimit(settings.historyLimit));
    await store.flush();
  }

  private static toVersion(value: preferences.ValueType): number {
    if (typeof value !== 'number' || !Number.isInteger(value)) {
      return 0;
    }
    return value >= 0 && value < VERSION_COUNT ? value : 0;
  }

  private static toCharset(value: preferences.ValueType): string {
    if (value === VCardConstants.CHARSET_GBK) {
      return VCardConstants.CHARSET_GBK;
    }
    return VCardConstants.CHARSET_UTF8;
  }

  private static toBoolean(value: preferences.ValueType): boolean {
    return typeof value === 'boolean' ? value : true;
  }

  private static toHistoryLimit(value: preferences.ValueType): number {
    if (typeof value !== 'number' || !Number.isInteger(value)) {
      return VCardConstants.DEFAULT_HISTORY_LIMIT;
    }
    return value >= HISTORY_LIMIT_MIN && value <= VCardConstants.HISTORY_LIMIT_MAX ? value :
      VCardConstants.DEFAULT_HISTORY_LIMIT;
  }
}
