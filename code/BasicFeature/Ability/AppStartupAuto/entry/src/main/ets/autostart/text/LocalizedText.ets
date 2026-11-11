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

import { BASE_TEXT } from './BaseText';
import { RecordValue } from '../RecordValues';
import { parseRefreshSource, RefreshSource } from '../AutoStartupTypes';
import { reportFailure } from '../SampleLogger';

export type TextResolver = (key: string) => string;
let resolver: TextResolver | undefined = undefined;
const refreshers: (() => void)[] = [];
const reportedKeys: Set<string> = new Set<string>();

/** String-based model/UI APIs share the same resource lookup and deterministic English bootstrap. */
export function localText(key: string): string {
  if (resolver !== undefined) {
    try {
      return resolver(key);
    } catch (_) {
      if (!reportedKeys.has(key)) {
        reportedKeys.add(key);
        reportFailure(`String resource ${key}`);
      }
    }
  }
  const fallback = BASE_TEXT.get(key);
  return fallback === undefined ? key : fallback;
}

/** Register catalog refreshes without resolving resources during module initialization. */
export function registerTextRefresh(refresh: () => void): void {
  refreshers.push(refresh);
}

/** Bind before loading any page. Tests inject a fixed locale rather than using device settings. */
export function setTextResolver(next: TextResolver | undefined): void {
  resolver = next;
  reportedKeys.clear();
  refreshers.forEach((refresh: () => void): void => refresh());
}

/** Replace numbered placeholders once, so braces in argument values remain literal. */
export function formatResource(key: string, values: string[]): string {
  return localText(key).replace(/\{(\d+)\}/g, (match: string, index: string): string => {
    const position = Number(index);
    return position < values.length ? values[position] : match;
  });
}

/** Refresh-source IDs never double as display labels. */
export function recordSourceLabel(value: string): string {
  switch (parseRefreshSource(value)) {
    case RefreshSource.INITIAL: return localText('startup_text_0006');
    case RefreshSource.MANUAL: return localText('startup_text_0007');
    case RefreshSource.FOREGROUND: return localText('startup_text_0008');
    case RefreshSource.SETTINGS: return localText('startup_text_0009');
    default: return localText('startup_text_0010');
  }
}

/** Only presentation maps legacy data values; persistence and comparisons keep schema-1 bytes. */
export function recordValueLabel(value: string): string {
  switch (value) {
    case RecordValue.ENABLED: return localText('startup_text_0168');
    case RecordValue.DISABLED: return localText('startup_text_0169');
    case RecordValue.UNSUPPORTED: return localText('startup_text_0170');
    case RecordValue.QUERY_UNSUPPORTED: return localText('startup_text_0171');
    case RecordValue.TIMEOUT: return localText('startup_text_0172');
    case RecordValue.PROBE_FAILED: return localText('startup_text_0201');
    case RecordValue.QUERY_FAILED: return localText('startup_text_0202');
    case RecordValue.NOT_QUERIED: return localText('startup_text_0556');
    case RecordValue.PENDING: return localText('startup_text_0011');
    case RecordValue.NOT_CALLED: return localText('startup_text_0198');
    case RecordValue.CALLING: return localText('startup_text_0199');
    case RecordValue.ERROR: return localText('startup_text_0200');
    default: return value;
  }
}
