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

/** String-only API adapter. Static ArkUI labels use $r directly. */
import { resourceManager } from '@kit.LocalizationKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { DEFAULT_STRINGS, LEGACY_DISPLAY_KEYS } from './LocaleDefaults';

const catalogRefreshers: Array<() => void> = [];

export function registerLocaleCatalog(refresh: () => void): void { catalogRefreshers.push(refresh); }

/** Test-only injection point; production always binds a real ResourceManager. */
export type LocaleResolver = (key: string) => string;

let injected: LocaleResolver | undefined = undefined;

/**
 * Inject a fixed resolver for isolated model tests so their text expectations do not
 * depend on the device language. Production never calls this; it is reset by
 * bindLocaleStrings and clearLocaleStrings.
 */
export function setLocaleResolverForTest(next: LocaleResolver | undefined): void {
  injected = next;
  catalogRefreshers.forEach((refresh: () => void): void => { refresh(); });
}

const resolved: Map<string, string> = new Map<string, string>();

/** Bind before constructing models. Language changes take effect after restarting this Ability. */
export function bindLocaleStrings(manager: resourceManager.ResourceManager): void {
  injected = undefined;
  resolved.clear();
  let missing: number = 0;
  DEFAULT_STRINGS.forEach((fallback: string, key: string): void => {
    try { resolved.set(key, manager.getStringByNameSync(key)); }
    catch (error) { resolved.set(key, fallback); missing++; }
  });
  catalogRefreshers.forEach((refresh: () => void): void => { refresh(); });
  if (missing > 0) {
    hilog.warn(0xF811, '[Sample_AppContinuation]', 'String resources unavailable: %{public}d', missing);
  }
}

/** Release session text without retaining an Ability context. Pure model callers use English defaults. */
export function clearLocaleStrings(): void {
  injected = undefined;
  resolved.clear();
  catalogRefreshers.forEach((refresh: () => void): void => { refresh(); });
}

/** Use only for known legacy enum display; never translate user data or serialized values. */
export function legacyLabel(value: string): string {
  const key: string | undefined = LEGACY_DISPLAY_KEYS.get(value);
  return key === undefined ? value : localize(key);
}

export function localize(key: string, values: Array<string | number | boolean> = []): string {
  let template: string = resolved.get(key) ?? DEFAULT_STRINGS.get(key) ?? key;
  const override = injected;
  if (override !== undefined) {
    try {
      template = override(key);
    } catch (error) {
      template = DEFAULT_STRINGS.get(key) ?? key;
    }
  }
  return template.replace(/\{(\d+)\}/g, (token: string, index: string): string => {
    const value = values[Number(index)];
    return value === undefined ? token : String(value);
  });
}
