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
 
import { preferences } from '@kit.ArkData';
import { common } from '@kit.AbilityKit';
import {
  PREFS_COUNT_KEY,
  PREFS_NAME,
  PREFS_TEXT_KEY,
  nextCount,
  readCount,
  readText
} from '../model/PrefsStore';

export class PrefsUtil {
  static open(context: common.Context): preferences.Preferences {
    return preferences.getPreferencesSync(context, { name: PREFS_NAME });
  }

  static async save(context: common.Context, text: string, currentCount: number): Promise<number> {
    const store = PrefsUtil.open(context);
    store.putSync(PREFS_TEXT_KEY, text);
    const count = nextCount(currentCount);
    store.putSync(PREFS_COUNT_KEY, count);
    await store.flush();
    return count;
  }

  static readTextValue(context: common.Context): string {
    const raw = PrefsUtil.open(context).getSync(PREFS_TEXT_KEY, '') as string | number | boolean;
    return readText(raw);
  }

  static readCountValue(context: common.Context): number {
    const raw = PrefsUtil.open(context).getSync(PREFS_COUNT_KEY, 0) as number | string | boolean;
    return readCount(raw);
  }

  static async removeText(context: common.Context): Promise<void> {
    const store = PrefsUtil.open(context);
    store.deleteSync(PREFS_TEXT_KEY);
    await store.flush();
  }

  static async clearAll(context: common.Context): Promise<void> {
    const store = PrefsUtil.open(context);
    store.clearSync();
    await store.flush();
  }
}
