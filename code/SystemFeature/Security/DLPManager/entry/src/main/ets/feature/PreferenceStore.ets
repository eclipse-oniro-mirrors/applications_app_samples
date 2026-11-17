/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import preferences from '@ohos.data.preferences';
import common from '@ohos.app.ability.common';
import { RecentModel, RECENT_CAPACITY, parseRecentText } from './RecentModel';
import { SettingsModel } from './SettingsModel';
import { TemplateModel, parseTemplateText } from './TemplateModel';

const STORE_NAME: string = 'dlp_settings_store';
const RECENT_KEY: string = 'recent_items_v1';
const TEMPLATE_KEY: string = 'custom_templates_v1';
const SETTINGS_KEY: string = 'settings_v1';

export class PreferenceStore {
  static async getText(context: common.UIAbilityContext, key: string): Promise<string> {
    try {
      const store: preferences.Preferences = await preferences.getPreferences(context, STORE_NAME);
      const value: preferences.ValueType = await store.get(key, '');
      if (typeof value === 'string') {
        return value;
      }
      return '';
    } catch (error) {
      return '';
    }
  }

  static async putText(context: common.UIAbilityContext, key: string, text: string): Promise<boolean> {
    try {
      const store: preferences.Preferences = await preferences.getPreferences(context, STORE_NAME);
      await store.put(key, text);
      await store.flush();
      return true;
    } catch (error) {
      return false;
    }
  }
}

export class RecentStore {
  static async load(context: common.UIAbilityContext): Promise<RecentModel> {
    const text: string = await PreferenceStore.getText(context, RECENT_KEY);
    return parseRecentText(text, RECENT_CAPACITY);
  }

  static async save(context: common.UIAbilityContext, model: RecentModel): Promise<boolean> {
    return PreferenceStore.putText(context, RECENT_KEY, model.serialize());
  }

  static async record(context: common.UIAbilityContext, name: string, uri: string, isDlp: boolean): Promise<void> {
    const model: RecentModel = await RecentStore.load(context);
    const nowSec: number = Math.floor(Date.now() / 1000);
    model.addOpen(name, uri, isDlp, nowSec);
    await RecentStore.save(context, model);
  }

  static async toggleFavorite(context: common.UIAbilityContext, id: string): Promise<RecentModel> {
    const model: RecentModel = await RecentStore.load(context);
    model.toggleFavorite(id);
    await RecentStore.save(context, model);
    return model;
  }

  static async removeItem(context: common.UIAbilityContext, id: string): Promise<RecentModel> {
    const model: RecentModel = await RecentStore.load(context);
    model.remove(id);
    await RecentStore.save(context, model);
    return model;
  }

  static async clearRecents(context: common.UIAbilityContext): Promise<RecentModel> {
    const model: RecentModel = await RecentStore.load(context);
    model.clearRecents();
    await RecentStore.save(context, model);
    return model;
  }
}

export class TemplateStore {
  static async load(context: common.UIAbilityContext): Promise<TemplateModel> {
    const text: string = await PreferenceStore.getText(context, TEMPLATE_KEY);
    return parseTemplateText(text);
  }

  static async save(context: common.UIAbilityContext, model: TemplateModel): Promise<boolean> {
    return PreferenceStore.putText(context, TEMPLATE_KEY, model.serialize());
  }
}

export class SettingsStore {
  static async load(context: common.UIAbilityContext): Promise<SettingsModel> {
    const text: string = await PreferenceStore.getText(context, SETTINGS_KEY);
    return SettingsModel.parse(text);
  }

  static async save(context: common.UIAbilityContext, model: SettingsModel): Promise<boolean> {
    return PreferenceStore.putText(context, SETTINGS_KEY, model.serialize());
  }
}
