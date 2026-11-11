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

import { formatResource, localText, recordSourceLabel, recordValueLabel } from '../text/LocalizedText';

import { QueryRecord } from '../AutoStartupTypes';
import { RevisitSession } from './RevisitTracker';
import { dateTimeText } from '../tools/DiagnosticTools';

function sample(record: QueryRecord | undefined): string {
  return record === undefined ? localText('startup_text_0524') :
    `query #${record.id}｜${recordSourceLabel(record.source)}｜${record.outcome}｜${recordValueLabel(record.result)}｜${dateTimeText(record.timestamp)}`;
}

/** Local terminal facts, never inferred system-setting visits or boot-start evidence. */
export function revisitDetails(session: RevisitSession | undefined): string[] {
  if (session === undefined) { return [localText('startup_text_0640')]; }
  const lines: string[] = [
    formatResource('startup_format_360de0970f87', [String(session.sessionId), String(session.stage), String(session.guidanceRevision)]),
    formatResource('startup_format_7b971e5c43f8', [String(dateTimeText(session.createdAt)), String(dateTimeText(session.leftAt)), String(dateTimeText(session.returnedAt))]),
    formatResource('startup_format_ffcd03352e3d', [String(dateTimeText(session.recheckedAt)), String(session.cancelled)]),
    formatResource('startup_format_39a7ab3f3050', [String(sample(session.before))]), formatResource('startup_format_80fe90e6fd9e', [String(sample(session.after))]), session.conclusion,
    localText('startup_text_0649')
  ];
  session.attempts.forEach((record: QueryRecord): void => {
    lines.push(formatResource('startup_format_3ce3e8a0287e', [String(sample(record)), String(record.errorCode || localText('startup_text_0524')), String(record.durationMillis)]));
  });
  return lines;
}
