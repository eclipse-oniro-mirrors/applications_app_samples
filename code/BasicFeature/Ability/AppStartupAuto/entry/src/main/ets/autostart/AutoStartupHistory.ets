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

import { formatResource, localText, recordSourceLabel, recordValueLabel } from './text/LocalizedText';
import { LegacyHistoryFilter, RecordValue } from './RecordValues';

/** Query-history codec, filtering and redacted export kept free of platform APIs. */
import { parseRefreshSource, QueryOutcome, QueryRecord, RefreshSource } from './AutoStartupTypes';

export interface HistoryStorage {
  read(): string;
  write(value: string): Promise<void>;
}

export class HistoryLoadResult {
  public records: QueryRecord[] = [];
  public notice: string = '';
  public expired: number = 0;
  public recovered: boolean = false;
}

class StoredHistory {
  public schema: number = HISTORY_SCHEMA;
  public savedAt: number = 0;
  public records: QueryRecord[] = [];
}

export const HISTORY_SCHEMA: number = 1;
export const HISTORY_LIMIT: number = 20;
export const HISTORY_MAX_AGE_MS: number = 30 * 24 * 60 * 60 * 1000;
export const HISTORY_MESSAGE_LIMIT: number = 512;
export const EXPORT_MESSAGE_LIMIT: number = 96;

const OUTCOMES: string[] = [
  QueryOutcome.SUCCESS, QueryOutcome.FAILURE, QueryOutcome.UNSUPPORTED,
  QueryOutcome.TIMEOUT, QueryOutcome.UNKNOWN
];

function finiteNonNegative(value: number): boolean {
  return typeof value === 'number' && Number.isFinite(value) && value >= 0;
}

function shortText(value: string, limit: number): string {
  return value.length > limit ? `${value.slice(0, Math.max(0, limit - 1))}…` : value;
}

/** Keeps platform messages inside the same limit used by restore validation. */
export function boundedMessage(value: string): string {
  return shortText(value, HISTORY_MESSAGE_LIMIT);
}

function outcomeOf(result: string, errorCode: string): QueryOutcome {
  if (result === RecordValue.ENABLED || result === RecordValue.DISABLED) {
    return QueryOutcome.SUCCESS;
  }
  if (result === RecordValue.UNSUPPORTED || result === RecordValue.QUERY_UNSUPPORTED) {
    return QueryOutcome.UNSUPPORTED;
  }
  if (result === RecordValue.TIMEOUT || errorCode === 'TIMEOUT') {
    return QueryOutcome.TIMEOUT;
  }
  if (result.length > 0) {
    return QueryOutcome.FAILURE;
  }
  return QueryOutcome.UNKNOWN;
}

export function normalizeRecord(record: QueryRecord): QueryRecord | undefined {
  if (record === null || typeof record !== 'object') {
    return undefined;
  }
  const source = typeof record.source === 'string' ? parseRefreshSource(record.source) : undefined;
  if (!Number.isSafeInteger(record.id) || record.id <= 0 || record.id >= Number.MAX_SAFE_INTEGER ||
    !finiteNonNegative(record.timestamp) || source === undefined || typeof record.result !== 'string' ||
    record.result.length === 0 || record.result.length > 200 ||
    typeof record.supportResult !== 'string' || record.supportResult.length > 200 ||
    typeof record.statusResult !== 'string' || record.statusResult.length > 200 ||
    typeof record.errorCode !== 'string' || record.errorCode.length > 64 ||
    typeof record.errorMessage !== 'string' || record.errorMessage.length > HISTORY_MESSAGE_LIMIT ||
    !finiteNonNegative(record.durationMillis)) {
    return undefined;
  }
  const copy: QueryRecord = new QueryRecord();
  copy.id = record.id;
  copy.timestamp = record.timestamp;
  copy.source = source;
  copy.result = record.result;
  copy.supportResult = record.supportResult;
  copy.statusResult = record.statusResult;
  copy.errorCode = record.errorCode;
  copy.errorMessage = record.errorMessage;
  copy.durationMillis = record.durationMillis;
  copy.outcome = typeof record.outcome === 'string' && OUTCOMES.indexOf(record.outcome as string) >= 0 ?
    record.outcome : outcomeOf(record.result, record.errorCode);
  return copy;
}

export function serializeHistory(records: QueryRecord[], savedAt: number): string {
  const stored: StoredHistory = new StoredHistory();
  stored.savedAt = savedAt;
  stored.records = records.slice(0, HISTORY_LIMIT).map((record: QueryRecord): QueryRecord => {
    const copy: QueryRecord = new QueryRecord();
    copy.id = record.id;
    copy.timestamp = record.timestamp;
    copy.source = parseRefreshSource(record.source) ?? record.source;
    copy.result = record.result;
    copy.supportResult = record.supportResult;
    copy.statusResult = record.statusResult;
    copy.errorCode = record.errorCode;
    copy.errorMessage = shortText(record.errorMessage, HISTORY_MESSAGE_LIMIT);
    copy.durationMillis = record.durationMillis;
    copy.outcome = record.outcome;
    return copy;
  });
  return JSON.stringify(stored);
}

function parseArray(values: Object[], now: number): HistoryLoadResult {
  const result: HistoryLoadResult = new HistoryLoadResult();
  const seen: Set<number> = new Set<number>();
  values.slice(0, HISTORY_LIMIT * 2).forEach((value: Object): void => {
    const record = normalizeRecord(value as QueryRecord);
    if (record === undefined || seen.has(record.id)) {
      return;
    }
    seen.add(record.id);
    if (now - record.timestamp > HISTORY_MAX_AGE_MS) {
      result.expired++;
      return;
    }
    result.records.push(record);
  });
  result.records.sort((left: QueryRecord, right: QueryRecord): number => right.timestamp - left.timestamp);
  if (result.records.length > HISTORY_LIMIT) {
    result.records = result.records.slice(0, HISTORY_LIMIT);
  }
  if (result.expired > 0) {
    result.notice = formatResource('startup_format_b7b21312ad6e', [String(result.expired)]);
  }
  return result;
}

export function parseHistory(raw: string, now: number): HistoryLoadResult {
  const result: HistoryLoadResult = new HistoryLoadResult();
  if (raw.length === 0) {
    return result;
  }
  let parsed: Object | null = null;
  try {
    parsed = JSON.parse(raw) as Object;
  } catch (error) {
    result.notice = localText('startup_text_0175');
    result.recovered = true;
    return result;
  }
  if (Array.isArray(parsed)) {
    result.recovered = true;
    const legacy: HistoryLoadResult = parseArray(parsed as Object[], now);
    result.records = legacy.records;
    result.expired = legacy.expired;
    result.notice = legacy.notice.length > 0 ? formatResource('startup_format_4ad3605744e9', [String(legacy.notice)]) : localText('startup_text_0177');
    return result;
  }
  if (parsed === null || typeof parsed !== 'object') {
    result.notice = localText('startup_text_0178');
    result.recovered = true;
    return result;
  }
  const stored = parsed as StoredHistory;
  if (stored.schema !== HISTORY_SCHEMA) {
    result.notice = localText('startup_text_0179');
    result.recovered = true;
    return result;
  }
  if (!Array.isArray(stored.records)) {
    result.notice = localText('startup_text_0180');
    result.recovered = true;
    return result;
  }
  const records = parseArray(stored.records as Object[], now);
  result.records = records.records;
  result.expired = records.expired;
  result.notice = records.notice;
  return result;
}

/** Filtering is defined on the persisted outcome, never on localized text. */
export function filterHistory(records: QueryRecord[], outcome: string): QueryRecord[] {
  if (outcome.length === 0 || outcome === 'all' || outcome === LegacyHistoryFilter.ALL) {
    return records.slice();
  }
  let wanted: string = outcome;
  if (outcome === LegacyHistoryFilter.SUCCESS) {
    wanted = QueryOutcome.SUCCESS;
  } else if (outcome === LegacyHistoryFilter.FAILURE) {
    wanted = QueryOutcome.FAILURE;
  } else if (outcome === LegacyHistoryFilter.UNSUPPORTED) {
    wanted = QueryOutcome.UNSUPPORTED;
  } else if (outcome === LegacyHistoryFilter.TIMEOUT) {
    wanted = QueryOutcome.TIMEOUT;
  }
  return records.filter((record: QueryRecord): boolean => (record.outcome as string) === wanted);
}

export function outcomeLabel(outcome: string): string {
  switch (outcome) {
    case QueryOutcome.SUCCESS:
      return localText('startup_text_0001');
    case QueryOutcome.FAILURE:
      return localText('startup_text_0002');
    case QueryOutcome.UNSUPPORTED:
      return localText('startup_text_0003');
    case QueryOutcome.TIMEOUT:
      return localText('startup_text_0004');
    default:
      return localText('startup_text_0005');
  }
}

function maskText(value: string): string {
  let text: string = value.replace(/[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}/g, localText('startup_text_0182'));
  text = text.replace(/\+?\d[\d\s-]{6,}\d/g, localText('startup_text_0183'));
  text = text.replace(/\d{6,}/g, localText('startup_text_0184'));
  text = text.replace(/[\r\n\t]+/g, ' ').trim();
  return shortText(text, EXPORT_MESSAGE_LIMIT);
}

/**
 * Exports a redacted, human-readable snapshot. It intentionally omits raw
 * platform messages and any identifier that could carry a phone number, email
 * or long numeric account value.
 */
export function exportRedacted(records: QueryRecord[], now: number): string {
  const lines: string[] = [localText('startup_text_0185'), formatResource('startup_format_82d647b9bd61', [String(new Date(now).toISOString())]),
    formatResource('startup_format_7098fbdcbc1f', [String(records.length)])];
  records.forEach((record: QueryRecord): void => {
    lines.push(`#${record.id} | ${new Date(record.timestamp).toISOString()} | ${recordSourceLabel(record.source)} | ` +
      `${outcomeLabel(record.outcome as string)} | ${maskText(recordValueLabel(record.result))} | ` +
      formatResource('startup_format_7ee4ac31499d', [String(maskText(recordValueLabel(record.supportResult)))]) +
      formatResource('startup_format_1f33ac9b39f7', [String(maskText(recordValueLabel(record.statusResult))), String(maskText(record.errorCode)), String(record.durationMillis)]));
    if (record.errorMessage.length > 0) {
      lines.push(formatResource('startup_format_02faa2b6c007', [String(maskText(record.errorMessage))]));
    }
  });
  return lines.join('\n');
}

export class HistorySummary {
  public total: number = 0;
  public success: number = 0;
  public failure: number = 0;
  public unsupported: number = 0;
  public timeout: number = 0;
  public unknown: number = 0;
  public latestValidId: number = -1;
  public newestAt: number = 0;
  public oldestAt: number = 0;
  public expiringSoon: number = 0;
}

/** Counts are derived from persisted outcomes, not from localized labels. */
export function summarizeHistory(records: QueryRecord[], now: number): HistorySummary {
  const summary: HistorySummary = new HistorySummary();
  summary.total = records.length;
  const expiry: number = 30 * 24 * 60 * 60 * 1000;
  records.forEach((record: QueryRecord): void => {
    switch (record.outcome) {
      case QueryOutcome.SUCCESS:
        summary.success++;
        if (summary.latestValidId < 0) {
          summary.latestValidId = record.id;
        }
        break;
      case QueryOutcome.FAILURE:
        summary.failure++;
        break;
      case QueryOutcome.UNSUPPORTED:
        summary.unsupported++;
        break;
      case QueryOutcome.TIMEOUT:
        summary.timeout++;
        break;
      default:
        summary.unknown++;
        break;
    }
    if (summary.newestAt === 0 || record.timestamp > summary.newestAt) {
      summary.newestAt = record.timestamp;
    }
    if (summary.oldestAt === 0 || record.timestamp < summary.oldestAt) {
      summary.oldestAt = record.timestamp;
    }
    if (now - record.timestamp >= expiry - 24 * 60 * 60 * 1000) {
      summary.expiringSoon++;
    }
  });
  return summary;
}

export class HistoryComparison {
  public beforeId: number = -1;
  public afterId: number = -1;
  public beforeResult: string = '';
  public afterResult: string = '';
  public changed: boolean = false;
  public beforeAt: number = 0;
  public afterAt: number = 0;
  public deltaMillis: number = 0;
}

/** Compares the two newest samples so the UI can show a real before/after delta. */
export function compareLatestRecords(records: QueryRecord[]): HistoryComparison {
  const comparison: HistoryComparison = new HistoryComparison();
  if (records.length === 0) {
    return comparison;
  }
  comparison.afterId = records[0].id;
  comparison.afterResult = records[0].result;
  comparison.afterAt = records[0].timestamp;
  if (records.length > 1) {
    comparison.beforeId = records[1].id;
    comparison.beforeResult = records[1].result;
    comparison.beforeAt = records[1].timestamp;
    comparison.deltaMillis = records[0].timestamp - records[1].timestamp;
  }
  comparison.changed = comparison.afterResult !== comparison.beforeResult;
  return comparison;
}

/** Time/source/outcome filter for diagnostics; all dimensions are optional. */
export function filterHistoryAdvanced(records: QueryRecord[], source: string, outcome: string,
  fromMillis: number, toMillis: number): QueryRecord[] {
  return records.filter((record: QueryRecord): boolean => {
    if (source.length > 0 && record.source !== (parseRefreshSource(source) ?? source)) {
      return false;
    }
    if (outcome.length > 0 && record.outcome !== outcome) {
      return false;
    }
    if (fromMillis > 0 && record.timestamp < fromMillis) {
      return false;
    }
    if (toMillis > 0 && record.timestamp > toMillis) {
      return false;
    }
    return true;
  });
}
