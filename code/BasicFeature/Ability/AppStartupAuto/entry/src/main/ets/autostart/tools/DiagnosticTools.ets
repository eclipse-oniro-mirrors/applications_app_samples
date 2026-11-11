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

import { formatResource, localText, recordValueLabel, registerTextRefresh } from '../text/LocalizedText';

/**
 * 诊断与导出用的小工具集合。
 *
 * 这里的每个函数都至少有一个生产调用点：历史面板、诊断页或导出。不再单独
 * 堆一套"没人用"的通用库。
 */

import { QueryOutcome, QueryRecord, RefreshSource } from '../AutoStartupTypes';

/** 明细文本上限：错误信息写盘前必须截断，避免二次失败。 */
export const DETAIL_LIMIT: number = 512;
/** 导出行上限，防止一次导出过大。 */
export const EXPORT_ROW_LIMIT: number = 200;
/** 历史记录上限。 */
export const RECORD_LIMIT: number = 20;

/** 按 UTF-16 单元截断，超限时追加省略标记。 */
export function clip(text: string, limit: number = DETAIL_LIMIT): string {
  const normalized: string = text.replace(/\r\n/g, '\n').replace(/\r/g, '\n');
  if (normalized.length <= limit) {
    return normalized;
  }
  const keep: number = Math.max(0, limit - 1);
  return `${normalized.slice(0, keep)}…`;
}

/** 去首尾空白并把连续空白折叠为单空格，用于列表展示。 */
export function compact(text: string): string {
  return text.replace(/\s+/g, ' ').trim();
}

/** 判断是否为空白串。 */
export function isBlank(text: string): boolean {
  return text.trim().length === 0;
}

/** 把时间戳格式化为 HH:mm:ss；非法值返回占位符。 */
export function clockText(timestamp: number): string {
  if (!Number.isFinite(timestamp) || timestamp <= 0) {
    return '--:--:--';
  }
  const date: Date = new Date(timestamp);
  const hours: string = date.getHours().toString().padStart(2, '0');
  const minutes: string = date.getMinutes().toString().padStart(2, '0');
  const seconds: string = date.getSeconds().toString().padStart(2, '0');
  return `${hours}:${minutes}:${seconds}`;
}

/** 把时间戳格式化为 MM-dd HH:mm。 */
export function dateTimeText(timestamp: number): string {
  if (!Number.isFinite(timestamp) || timestamp <= 0) {
    return localText('startup_text_0748');
  }
  const date: Date = new Date(timestamp);
  const month: string = (date.getMonth() + 1).toString().padStart(2, '0');
  const day: string = date.getDate().toString().padStart(2, '0');
  return `${month}-${day} ${clockText(timestamp)}`;
}

/** 相对时间：刚刚 / N 分钟前 / N 小时前 / N 天前。 */
export function relativeText(timestamp: number, now: number): string {
  if (!Number.isFinite(timestamp) || timestamp <= 0) {
    return localText('startup_text_0749');
  }
  const delta: number = Math.max(0, now - timestamp);
  if (delta < 60 * 1000) {
    return localText('startup_text_0750');
  }
  if (delta < 60 * 60 * 1000) {
    return formatResource('startup_format_66f93fe5e906', [String(Math.floor(delta / 60000))]);
  }
  if (delta < 24 * 60 * 60 * 1000) {
    return formatResource('startup_format_6504a911f9e1', [String(Math.floor(delta / 3600000))]);
  }
  return formatResource('startup_format_09f12da9a77f', [String(Math.floor(delta / 86400000))]);
}

/** 时长文本：毫秒以下保留整数，超过 1 秒用秒。 */
export function durationText(millis: number): string {
  if (!Number.isFinite(millis) || millis < 0) {
    return localText('startup_text_0754');
  }
  if (millis < 1000) {
    return `${Math.round(millis)} ms`;
  }
  return `${(millis / 1000).toFixed(2)} s`;
}

/** 结果标签，历史面板与导出共用。 */
export function outcomeLabel(outcome: QueryOutcome): string {
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

/** 来源标签。 */
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
      return localText('startup_text_0010');
  }
}

/** 掩码化：保留首尾字符，中间用星号；短于 5 位整体掩码。 */
export function maskToken(value: string): string {
  const text: string = value.trim();
  if (text.length === 0) {
    return '';
  }
  if (text.length < 5) {
    return '*'.repeat(text.length);
  }
  const head: string = text.slice(0, 2);
  const tail: string = text.slice(text.length - 2);
  return `${head}${'*'.repeat(Math.min(6, text.length - 4))}${tail}`;
}

/** 常见敏感字段名，导出时一律掩码。 */
export const SENSITIVE_KEYS: string[] = ['token', 'udid', 'serial', 'imei', 'oaid', 'bundle',
  'device', 'sn', 'mac', 'ip'];

/** 判断字段名是否敏感（大小写不敏感、包含匹配）。 */
export function isSensitiveKey(key: string): boolean {
  const lower: string = key.toLowerCase();
  for (const candidate of SENSITIVE_KEYS) {
    if (lower.includes(candidate)) {
      return true;
    }
  }
  return false;
}

/** 记录是否可以进入导出。 */
export function exportable(record: QueryRecord): boolean {
  return record.id > 0 && record.timestamp > 0;
}

/** 裁剪导出集合：按时间倒序，最多 200 条。 */
export function selectForExport(records: QueryRecord[]): QueryRecord[] {
  const valid: QueryRecord[] = records.filter((record: QueryRecord): boolean => exportable(record));
  valid.sort((left: QueryRecord, right: QueryRecord): number => right.timestamp - left.timestamp);
  if (valid.length <= EXPORT_ROW_LIMIT) {
    return valid;
  }
  return valid.slice(0, EXPORT_ROW_LIMIT);
}

let CSV_HEADER: string = localText('startup_text_0755');
registerTextRefresh((): void => { CSV_HEADER = localText('startup_text_0755'); });

function csvCell(value: string): string {
  const safe: string = value.replace(/"/g, '""');
  if (safe.includes(',') || safe.includes('"') || safe.includes('\n')) {
    return `"${safe}"`;
  }
  return safe;
}

/** 导出 CSV。错误信息按错误码输出，不写原始详情。 */
export function toCsv(records: QueryRecord[]): string {
  const rows: string[] = [CSV_HEADER];
  selectForExport(records).forEach((record: QueryRecord): void => {
    rows.push([
      record.id.toString(),
      dateTimeText(record.timestamp),
      csvCell(sourceLabel(record.source)),
      csvCell(outcomeLabel(record.outcome)),
      csvCell(record.result.length === 0 ? localText('startup_text_0556') : recordValueLabel(record.result)),
      record.errorCode.length === 0 ? '-' : record.errorCode,
      Math.max(0, Math.round(record.durationMillis)).toString()
    ].join(','));
  });
  return rows.join('\n');
}

/** 导出 Markdown 表格，便于贴到问题单。 */
export function toMarkdown(records: QueryRecord[]): string {
  const lines: string[] = [localText('startup_text_0756'),
    '|---:|---|---|---|---|---|'];
  selectForExport(records).forEach((record: QueryRecord): void => {
    lines.push(`| ${record.id} | ${dateTimeText(record.timestamp)} | ${sourceLabel(record.source)} | ` +
      `${outcomeLabel(record.outcome)} | ${record.result.length === 0 ? localText('startup_text_0556') : recordValueLabel(record.result)} | ` +
      `${record.errorCode.length === 0 ? '-' : record.errorCode} |`);
  });
  return lines.join('\n');
}

/** 校验数值区间。 */
export function inRange(value: number, min: number, max: number): boolean {
  if (!Number.isFinite(value)) {
    return false;
  }
  return value >= min && value <= max;
}

/** 校验枚举成员。 */
export function isKnownOutcome(value: string): boolean {
  return value === QueryOutcome.SUCCESS || value === QueryOutcome.FAILURE ||
    value === QueryOutcome.UNSUPPORTED || value === QueryOutcome.TIMEOUT ||
    value === QueryOutcome.UNKNOWN;
}

/** 校验来源成员。 */
export function isKnownSource(value: string): boolean {
  return value === RefreshSource.INITIAL || value === RefreshSource.MANUAL ||
    value === RefreshSource.FOREGROUND || value === RefreshSource.SETTINGS;
}

/** 单调时钟差值；负值归零，避免时间回拨导致负数耗时。 */
export function elapsedSince(start: number, end: number): number {
  if (!Number.isFinite(start) || !Number.isFinite(end)) {
    return 0;
  }
  return Math.max(0, end - start);
}

/** 百分比：分母为 0 返回 0，不抛错。 */
export function ratioPercent(part: number, total: number): number {
  if (!Number.isFinite(part) || !Number.isFinite(total) || total <= 0) {
    return 0;
  }
  return Math.round((part / total) * 1000) / 10;
}

/** 最近 N 条记录。 */
export function latestRecords(records: QueryRecord[], count: number): QueryRecord[] {
  if (count <= 0) {
    return [];
  }
  const sorted: QueryRecord[] = records.slice();
  sorted.sort((left: QueryRecord, right: QueryRecord): number => right.timestamp - left.timestamp);
  return sorted.slice(0, Math.min(count, sorted.length));
}

/** 按结果分组计数。 */
export function countByOutcome(records: QueryRecord[]): Map<QueryOutcome, number> {
  const counts: Map<QueryOutcome, number> = new Map<QueryOutcome, number>();
  records.forEach((record: QueryRecord): void => {
    const current: number | undefined = counts.get(record.outcome);
    counts.set(record.outcome, (current === undefined ? 0 : current) + 1);
  });
  return counts;
}
