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

import { abilityDelegatorRegistry } from '@kit.TestKit';
import { common } from '@kit.AbilityKit';

/**
 * 保证 AppStorage 中存在 context，供 ResourceConversion、PreferencesUtil 等直接读全局上下文的类使用。
 */
export function ensureAppContext(): void {
  if (!AppStorage.get('context')) {
    AppStorage.setOrCreate('context', abilityDelegatorRegistry.getAbilityDelegator().getAppContext());
  }
}

export function appContext(): common.Context {
  const context: common.Context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
  AppStorage.setOrCreate('context', context);
  return context;
}

export function uiAbilityContext(): common.UIAbilityContext {
  return appContext() as common.UIAbilityContext;
}

/**
 * 修改 AppStorage 键的临时快照。用例结束前调用 restore() 把值写回原样，
 * 避免状态类用例污染其他套件（例如把 isPlay 写成 true 后，后面的界面用例判断失误）。
 */
export class StorageSnapshot {
  private readonly keys: string[] = [];
  private readonly values: Object[] = [];
  private readonly existed: boolean[] = [];

  capture(...keys: string[]): StorageSnapshot {
    for (let key of keys) {
      this.keys.push(key);
      let value: Object | undefined = AppStorage.get<Object>(key);
      this.existed.push(value !== undefined);
      this.values.push(value === undefined ? '' : value);
    }
    return this;
  }

  restore(): void {
    for (let i = 0; i < this.keys.length; i++) {
      if (this.existed[i]) {
        AppStorage.setOrCreate<Object>(this.keys[i], this.values[i]);
      } else {
        AppStorage.delete(this.keys[i]);
      }
    }
  }
}

let tempKeySeed: number = 0;

/**
 * 生成带用例标识的临时键，保证与真实业务键不冲突，并且多次执行可复现。
 */
export function tempKey(prefix: string): string {
  tempKeySeed++;
  return `subtest_${prefix}_${tempKeySeed}`;
}
