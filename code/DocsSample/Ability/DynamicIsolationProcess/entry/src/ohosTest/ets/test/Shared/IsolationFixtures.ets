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

/**
 * Pure model fixtures for the DynamicIsolationProcess sample.
 *
 * The model mirrors MyAbilityStage.onNewProcessRequest, the process name
 * composition rule (bundleName:key) and the want that pages/Index.ets sends
 * to EntryAbility1 through the UIAbilityContext kept in GlobalThis.
 */

export const SAMPLE_BUNDLE: string = 'com.sample.dynamicisolationprocess';
export const SAMPLE_MODULE: string = 'entry';
export const MAIN_ABILITY: string = 'EntryAbility';
export const ISOLATED_ABILITY: string = 'EntryAbility1';
export const ISOLATION_KEY: string = 'testKey';
export const KEY_MAX_LENGTH: number = 64;
export const NAME_MAX_LENGTH: number = 128;
export const STATE_CREATED: number = 0;
export const STATE_FOREGROUND: number = 1;
export const STATE_BACKGROUND: number = 2;
export const STATE_DESTROYED: number = 3;
export const ERROR_SUCCESS: number = 0;
export const ERROR_INVALID_PARAM: number = 401;
export const ERROR_WANT_INVALID: number = 16000021;
export const ERROR_CONTEXT_MISSING: number = 16000022;

export interface IsolationWant {
  bundleName: string;
  moduleName: string;
  abilityName: string;
}

export class IsolationModel {
  static isValidBundleName(name: string): boolean {
    return name.length > 0 && name.length <= NAME_MAX_LENGTH && name.includes('.') &&
      !name.includes(' ');
  }

  static isValidModule(moduleName: string): boolean {
    return moduleName.length > 0 && !moduleName.includes(' ') && !moduleName.includes('/');
  }

  static isValidAbilityName(name: string): boolean {
    return name.length > 0 && !name.includes(' ') && !name.includes('/') &&
      name.length <= NAME_MAX_LENGTH;
  }

  static isValidIsolationKey(key: string): boolean {
    if (key.length === 0 || key.length > KEY_MAX_LENGTH) {
      return false;
    }
    const allowed: string = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_';
    for (let index: number = 0; index < key.length; index++) {
      if (!allowed.includes(key.charAt(index))) {
        return false;
      }
    }
    return true;
  }

  static composeProcessName(bundleName: string, key: string): string {
    return bundleName + ':' + key;
  }

  static normalizeKey(key: string): string {
    return key.trim();
  }

  static isSameProcessName(first: string, second: string): boolean {
    return first === second && first.includes(':');
  }

  static buildWant(bundleName: string, moduleName: string, abilityName: string): IsolationWant {
    const want: IsolationWant = {
      bundleName: bundleName,
      moduleName: moduleName,
      abilityName: abilityName
    };
    return want;
  }

  static isValidWant(want: IsolationWant): boolean {
    return IsolationModel.isValidBundleName(want.bundleName) &&
      IsolationModel.isValidModule(want.moduleName) &&
      IsolationModel.isValidAbilityName(want.abilityName);
  }

  static wantEquals(first: IsolationWant, second: IsolationWant): boolean {
    return first.bundleName === second.bundleName && first.moduleName === second.moduleName &&
      first.abilityName === second.abilityName;
  }

  static formatWant(want: IsolationWant): string {
    return want.bundleName + '/' + want.moduleName + '/' + want.abilityName;
  }

  static stateName(state: number): string {
    if (state === STATE_CREATED) {
      return 'onCreate';
    }
    if (state === STATE_FOREGROUND) {
      return 'onForeground';
    }
    if (state === STATE_BACKGROUND) {
      return 'onBackground';
    }
    if (state === STATE_DESTROYED) {
      return 'onDestroy';
    }
    return 'unknown';
  }

  static canStart(state: number): boolean {
    return state === STATE_CREATED || state === STATE_BACKGROUND;
  }

  static nextState(state: number, event: string): number {
    if (event === 'foreground' && IsolationModel.canStart(state)) {
      return STATE_FOREGROUND;
    }
    if (event === 'background' && state === STATE_FOREGROUND) {
      return STATE_BACKGROUND;
    }
    if (event === 'destroy' && state !== STATE_DESTROYED) {
      return STATE_DESTROYED;
    }
    return state;
  }

  static describeError(err: string | null): string {
    if (err === null) {
      return 'start EntryAbility1: null';
    }
    return 'start EntryAbility1: ' + err;
  }

  static errorMessage(code: number): string {
    if (code === ERROR_SUCCESS) {
      return 'success';
    }
    if (code === ERROR_INVALID_PARAM) {
      return 'invalid parameter';
    }
    if (code === ERROR_WANT_INVALID) {
      return 'want is invalid';
    }
    if (code === ERROR_CONTEXT_MISSING) {
      return 'ui ability context missing';
    }
    return 'unknown error';
  }

  static isSuccessCode(code: number): boolean {
    return code === ERROR_SUCCESS;
  }

  static contextCount(keys: Array<string>): number {
    return keys.length;
  }

  static hasContext(keys: Array<string>, key: string): boolean {
    return keys.includes(key);
  }

  static isValidContextKey(key: string): boolean {
    return key.length > 0 && !key.includes(' ');
  }

  static abilityLifecycleIndex(name: string): number {
    if (name === 'onCreate') {
      return 0;
    }
    if (name === 'onWindowStageCreate') {
      return 1;
    }
    if (name === 'onForeground') {
      return 2;
    }
    if (name === 'onBackground') {
      return 3;
    }
    if (name === 'onWindowStageDestroy') {
      return 4;
    }
    if (name === 'onDestroy') {
      return 5;
    }
    return -1;
  }

  static describeIsolation(bundleName: string, key: string): string {
    return 'process=' + IsolationModel.composeProcessName(bundleName, key);
  }
}
