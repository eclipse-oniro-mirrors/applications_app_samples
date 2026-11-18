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

export interface BatchStorage {
  read(context: common.ApplicationContext): Promise<string>;
  write(value: string): Promise<void>;
}

export class PreferencesBatchStorage implements BatchStorage {
  private store: preferences.Preferences | undefined = undefined;

  async read(context: common.ApplicationContext): Promise<string> {
    const store: preferences.Preferences = await preferences.getPreferences(context,
      { name: 'shortcut_visibility_batches_v1' });
    const raw: preferences.ValueType = await store.get('journal', '');
    if (typeof raw !== 'string') { throw new Error('batch storage format'); }
    this.store = store;
    return raw;
  }

  async write(value: string): Promise<void> {
    const store: preferences.Preferences | undefined = this.store;
    if (store === undefined) { throw new Error('batch storage unavailable'); }
    await store.put('journal', value);
    await store.flush();
  }
}
