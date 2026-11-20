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
 

export const PREFS_NAME: string = 'atomic_service_demo_store';
export const PREFS_TEXT_KEY: string = 'demoText';
export const PREFS_COUNT_KEY: string = 'demoCount';
export const PREFS_MAX_LENGTH: number = 80;

export function normalizePrefsText(raw: string): string {
  const trimmed = raw.trim();
  return trimmed.length > PREFS_MAX_LENGTH ? trimmed.substring(0, PREFS_MAX_LENGTH) : trimmed;
}

export function canSaveText(raw: string): boolean {
  return normalizePrefsText(raw).length > 0;
}

export function nextCount(current: number): number {
  return current >= 0 ? current + 1 : 1;
}

export function readCount(value: number | string | boolean): number {
  if (typeof value === 'number' && value > 0) {
    return Math.floor(value);
  }
  return 0;
}

export function readText(value: number | string | boolean): string {
  return typeof value === 'string' ? value : '';
}

export function buildPrefsSummary(text: string, count: number): string {
  if (text.length > 0) {
    return `Saved "${text}", read ${count} times`;
  }
  return `No content yet, read ${count} times`;
}
