/** Query-history codec, filtering and redacted export kept free of platform APIs. */
import { QueryOutcome, QueryRecord, RefreshSource } from './AutoStartupTypes';

export interface HistoryStorage {
  read(): string;
  write(value: string): Promise<void>;
}

export class HistoryLoadResult {
  records: QueryRecord[] = [];
  notice: string = '';
  expired: number = 0;
  recovered: boolean = false;
}

class StoredHistory {
  schema: number = HISTORY_SCHEMA;
  savedAt: number = 0;
  records: QueryRecord[] = [];
}

export const HISTORY_SCHEMA: number = 1;
export const HISTORY_LIMIT: number = 20;
export const HISTORY_MAX_AGE_MS: number = 30 * 24 * 60 * 60 * 1000;
export const HISTORY_MESSAGE_LIMIT: number = 512;
export const EXPORT_MESSAGE_LIMIT: number = 96;

const SOURCES: string[] = [
  RefreshSource.INITIAL, RefreshSource.MANUAL, RefreshSource.FOREGROUND, RefreshSource.SETTINGS
];
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
  if (result === '已开启' || result === '未开启') {
    return QueryOutcome.SUCCESS;
  }
  if (result === '设备不支持' || result === '查询不支持') {
    return QueryOutcome.UNSUPPORTED;
  }
  if (result === '等待超时' || errorCode === 'TIMEOUT') {
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
  if (!Number.isSafeInteger(record.id) || record.id <= 0 || record.id >= Number.MAX_SAFE_INTEGER ||
    !finiteNonNegative(record.timestamp) || typeof record.source !== 'string' ||
    SOURCES.indexOf(record.source) < 0 || typeof record.result !== 'string' ||
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
  copy.source = record.source as RefreshSource;
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
    copy.source = record.source;
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
    result.notice = `已清理 ${result.expired} 条超过 30 天的历史记录`;
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
    result.notice = '历史记录损坏，已忽略并以空记录启动';
    result.recovered = true;
    return result;
  }
  if (Array.isArray(parsed)) {
    result.recovered = true;
    const legacy: HistoryLoadResult = parseArray(parsed as Object[], now);
    result.records = legacy.records;
    result.expired = legacy.expired;
    result.notice = legacy.notice.length > 0 ? `已迁移旧版历史；${legacy.notice}` : '已迁移旧版历史记录';
    return result;
  }
  if (parsed === null || typeof parsed !== 'object') {
    result.notice = '历史记录格式无效，已忽略';
    result.recovered = true;
    return result;
  }
  const stored = parsed as StoredHistory;
  if (stored.schema !== HISTORY_SCHEMA) {
    result.notice = '历史记录版本不受支持，已忽略';
    result.recovered = true;
    return result;
  }
  if (!Array.isArray(stored.records)) {
    result.notice = '历史记录缺少列表，已忽略';
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
  if (outcome.length === 0 || outcome === '全部') {
    return records.slice();
  }
  let wanted: string = outcome;
  if (outcome === '成功') {
    wanted = QueryOutcome.SUCCESS;
  } else if (outcome === '失败') {
    wanted = QueryOutcome.FAILURE;
  } else if (outcome === '不支持') {
    wanted = QueryOutcome.UNSUPPORTED;
  } else if (outcome === '超时') {
    wanted = QueryOutcome.TIMEOUT;
  }
  return records.filter((record: QueryRecord): boolean => (record.outcome as string) === wanted);
}

export function outcomeLabel(outcome: string): string {
  switch (outcome) {
    case QueryOutcome.SUCCESS:
      return '成功';
    case QueryOutcome.FAILURE:
      return '失败';
    case QueryOutcome.UNSUPPORTED:
      return '不支持';
    case QueryOutcome.TIMEOUT:
      return '超时';
    default:
      return '未知';
  }
}

function maskText(value: string): string {
  let text: string = value.replace(/[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}/g, '[邮箱]');
  text = text.replace(/\+?\d[\d\s-]{6,}\d/g, '[号码]');
  text = text.replace(/\d{6,}/g, '[编号]');
  text = text.replace(/[\r\n\t]+/g, ' ').trim();
  return shortText(text, EXPORT_MESSAGE_LIMIT);
}

/**
 * Exports a redacted, human-readable snapshot. It intentionally omits raw
 * platform messages and any identifier that could carry a phone number, email
 * or long numeric account value.
 */
export function exportRedacted(records: QueryRecord[], now: number): string {
  const lines: string[] = ['自启查询历史（脱敏导出）', `生成时间：${new Date(now).toISOString()}`,
    `记录数：${records.length}`];
  records.forEach((record: QueryRecord): void => {
    lines.push(`#${record.id} | ${new Date(record.timestamp).toISOString()} | ${record.source} | ` +
      `${outcomeLabel(record.outcome as string)} | ${maskText(record.result)} | 支持 ${maskText(record.supportResult)} | ` +
      `状态 ${maskText(record.statusResult)} | 错误码 ${maskText(record.errorCode)} | ${record.durationMillis} ms`);
    if (record.errorMessage.length > 0) {
      lines.push(`  说明：${maskText(record.errorMessage)}`);
    }
  });
  return lines.join('\n');
}

export class HistorySummary {
  total: number = 0;
  success: number = 0;
  failure: number = 0;
  unsupported: number = 0;
  timeout: number = 0;
  unknown: number = 0;
  latestValidId: number = -1;
  newestAt: number = 0;
  oldestAt: number = 0;
  expiringSoon: number = 0;
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
  beforeId: number = -1;
  afterId: number = -1;
  beforeResult: string = '';
  afterResult: string = '';
  changed: boolean = false;
  beforeAt: number = 0;
  afterAt: number = 0;
  deltaMillis: number = 0;
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
    if (source.length > 0 && record.source !== source) {
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
