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

import { localText, recordValueLabel } from '../autostart/text/LocalizedText';
import { RecordValue } from '../autostart/RecordValues';

import { QueryPhase, QuerySnapshot, RefreshSource, SupportState } from '../autostart/AutoStartupTypes';

function twoDigits(value: number): string {
  return value < 10 ? `0${value}` : `${value}`;
}

export function formatQueryTime(timestamp: number): string {
  if (timestamp <= 0) {
    return localText('startup_text_0758');
  }
  const date = new Date(timestamp);
  return `${twoDigits(date.getMonth() + 1)}-${twoDigits(date.getDate())} ` +
    `${twoDigits(date.getHours())}:${twoDigits(date.getMinutes())}:${twoDigits(date.getSeconds())}`;
}

export function sourceLabel(source: RefreshSource): string {
  switch (source) {
    case RefreshSource.INITIAL:
      return localText('startup_text_0006');
    case RefreshSource.MANUAL:
      return localText('startup_text_0007');
    case RefreshSource.FOREGROUND:
      return localText('startup_text_0008');
    case RefreshSource.SETTINGS:
      return localText('startup_text_0009');
    default:
      return localText('startup_text_0759');
  }
}

export function supportLabel(support: SupportState): string {
  switch (support) {
    case SupportState.SUPPORTED:
      return localText('startup_text_0257');
    case SupportState.UNSUPPORTED:
      return localText('startup_text_0003');
    case SupportState.FAILED:
      return localText('startup_text_0201');
    default:
      return localText('startup_text_0760');
  }
}

export function statusLabel(snapshot: QuerySnapshot): string {
  switch (snapshot.phase) {
    case QueryPhase.CHECKING:
    case QueryPhase.QUERYING:
      return localText('startup_text_0761');
    case QueryPhase.SUCCEEDED:
      if (snapshot.value === null) {
        return localText('startup_text_0762');
      }
      return snapshot.value === true ? localText('startup_text_0763') : localText('startup_text_0764');
    case QueryPhase.UNSUPPORTED:
      return snapshot.support === SupportState.UNSUPPORTED ? localText('startup_text_0170') : localText('startup_text_0765');
    case QueryPhase.FAILED:
      return snapshot.support === SupportState.FAILED ? localText('startup_text_0201') : localText('startup_text_0202');
    case QueryPhase.TIMEOUT:
      return localText('startup_text_0766');
    default:
      return localText('startup_text_0762');
  }
}

export function apiResultLabel(result: string): string {
  return result === '' || result === RecordValue.PENDING ? localText('startup_text_0198') : recordValueLabel(result);
}
