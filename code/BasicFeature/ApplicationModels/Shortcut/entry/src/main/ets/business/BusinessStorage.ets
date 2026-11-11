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

export class BusinessWriteError extends Error {
  public uncertain: boolean;
  constructor(message: string, uncertain: boolean) {
    super(message);
    this.uncertain = uncertain;
  }
}

export interface BusinessStorage {
  read(context: common.ApplicationContext): Promise<string>;
  write(value: string): Promise<void>;
  reload(context: common.ApplicationContext): Promise<string>;
}

export class PreferencesBusinessStorage implements BusinessStorage {
  private store: preferences.Preferences | undefined = undefined;
  private namespace: string;

  constructor(namespace: string = 'shortcut_business_v1') {
    this.namespace = namespace;
  }

  async read(context: common.ApplicationContext): Promise<string> {
    const store: preferences.Preferences = await preferences.getPreferences(context,
      { name: this.namespace });
    const raw: preferences.ValueType = await store.get('workspace', '');
    if (typeof raw !== 'string') { throw new Error("Invalid storage format"); }
    this.store = store;
    return raw;
  }

  async reload(context: common.ApplicationContext): Promise<string> {
    this.store = undefined;
    await preferences.removePreferencesFromCache(context, this.namespace);
    return this.read(context);
  }

  async write(value: string): Promise<void> {
    const store: preferences.Preferences | undefined = this.store;
    if (store === undefined) { throw new BusinessWriteError("Storage has not been initialized", false); }
    try {
      await store.put('workspace', value);
      await store.flush();
    } catch (_) {
      throw new BusinessWriteError("Write result has not been confirmed", true);
    }
  }
}
