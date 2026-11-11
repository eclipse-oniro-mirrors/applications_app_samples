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
 * 历史记录的展示模型：把服务已有的过滤、汇总、比较和导出结果翻译成页面可渲染的文本。
 * 本文件不含系统调用，页面与测试共用同一份判定，避免“页面自己再算一遍”。
 */
import { QueryOutcome, QueryRecord, RefreshSource } from '../AutoStartupTypes';
import { HistoryComparison, HistorySummary, compareLatestRecords, exportRedacted,
  filterHistoryAdvanced, summarizeHistory } from '../AutoStartupHistory';
import { compareSamples } from '../revisit/RevisitTracker';
import { outcomeLabel, sourceLabel, dateTimeText } from '../tools/DiagnosticTools';

/** 结果筛选项：空串表示不限。 */
export class OutcomeOption {
  public value: string = '';
  public label: string = '';

  constructor(value: string = '', label: string = '') {
    this.value = value;
    this.label = label;
  }
}

function createOUTCOME_OPTIONS(): OutcomeOption[] {
  return [
  new OutcomeOption('', localText('startup_text_0509')),
  new OutcomeOption('success', localText('startup_text_0001')),
  new OutcomeOption('failure', localText('startup_text_0002')),
  new OutcomeOption('unsupported', localText('startup_text_0003')),
  new OutcomeOption('timeout', localText('startup_text_0004')),
  new OutcomeOption('unknown', localText('startup_text_0005'))
];
}
export const OUTCOME_OPTIONS: OutcomeOption[] = createOUTCOME_OPTIONS();
registerTextRefresh((): void => {
  OUTCOME_OPTIONS.splice(0, OUTCOME_OPTIONS.length);
  createOUTCOME_OPTIONS().forEach((item: OutcomeOption): void => { OUTCOME_OPTIONS.push(item); });
});

/** 来源筛选项：空串表示不限。 */
export class SourceOption {
  public value: string = '';
  public label: string = '';

  constructor(value: string = '', label: string = '') {
    this.value = value;
    this.label = label;
  }
}

function createSOURCE_OPTIONS(): SourceOption[] {
  return [
  new SourceOption('', localText('startup_text_0510')),
  new SourceOption(RefreshSource.INITIAL as string, localText('startup_text_0006')),
  new SourceOption(RefreshSource.MANUAL as string, localText('startup_text_0007')),
  new SourceOption(RefreshSource.FOREGROUND as string, localText('startup_text_0511')),
  new SourceOption(RefreshSource.SETTINGS as string, localText('startup_text_0009'))
];
}
export const SOURCE_OPTIONS: SourceOption[] = createSOURCE_OPTIONS();
registerTextRefresh((): void => {
  SOURCE_OPTIONS.splice(0, SOURCE_OPTIONS.length);
  createSOURCE_OPTIONS().forEach((item: SourceOption): void => { SOURCE_OPTIONS.push(item); });
});

/** 时间范围预设。 */
export enum RangePreset {
  ALL = 'all',
  HOUR = 'hour',
  DAY = 'day',
  WEEK = 'week'
}

export class RangeOption {
  public preset: RangePreset = RangePreset.ALL;
  public label: string = '';

  constructor(preset: RangePreset = RangePreset.ALL, label: string = '') {
    this.preset = preset;
    this.label = label;
  }
}

function createRANGE_OPTIONS(): RangeOption[] {
  return [
  new RangeOption(RangePreset.ALL, localText('startup_text_0512')),
  new RangeOption(RangePreset.HOUR, localText('startup_text_0513')),
  new RangeOption(RangePreset.DAY, localText('startup_text_0514')),
  new RangeOption(RangePreset.WEEK, localText('startup_text_0515'))
];
}
export const RANGE_OPTIONS: RangeOption[] = createRANGE_OPTIONS();
registerTextRefresh((): void => {
  RANGE_OPTIONS.splice(0, RANGE_OPTIONS.length);
  createRANGE_OPTIONS().forEach((item: RangeOption): void => { RANGE_OPTIONS.push(item); });
});

/** 时间范围。 */
export class TimeRange {
  public from: number = 0;
  public to: number = 0;

  constructor(from: number = 0, to: number = 0) {
    this.from = from;
    this.to = to;
  }

  text(): string {
    if (this.from === 0) {
      return localText('startup_text_0512');
    }
    return formatResource('startup_format_6e141419ecdd', [String(dateTimeText(this.from))]);
  }
}

/** 由预设推导时间窗口；无样本时返回全区间。 */
export function rangeOf(preset: RangePreset, now: number): TimeRange {
  const hour: number = 3600000;
  if (preset === RangePreset.HOUR) {
    return new TimeRange(now - hour, now);
  }
  if (preset === RangePreset.DAY) {
    return new TimeRange(now - 24 * hour, now);
  }
  if (preset === RangePreset.WEEK) {
    return new TimeRange(now - 7 * 24 * hour, now);
  }
  return new TimeRange(0, now);
}

/** 过滤条件组合。 */
export class HistoryFilter {
  public outcome: string = '';
  public source: string = '';
  public preset: RangePreset = RangePreset.ALL;

  constructor(outcome: string = '', source: string = '', preset: RangePreset = RangePreset.ALL) {
    this.outcome = outcome;
    this.source = source;
    this.preset = preset;
  }

  reset(): void {
    this.outcome = '';
    this.source = '';
    this.preset = RangePreset.ALL;
  }

  text(): string {
    const outcome: string = this.outcome.length === 0 ? localText('startup_text_0509') :
      outcomeLabel(this.outcome as QueryOutcome);
    const source: string = this.source.length === 0 ? localText('startup_text_0510') :
      sourceLabel(this.source as RefreshSource);
    const range: TimeRange = rangeOf(this.preset, Date.now());
    return `${outcome}｜${source}｜${range.text()}`;
  }
}

/** 单条记录摘要。 */
export function describeRecord(record: QueryRecord): string {
  const duration: string = record.durationMillis > 0 ? `${record.durationMillis} ms` : localText('startup_text_0517');
  const error: string = record.errorCode.length > 0 ? formatResource('startup_format_57eeec9dc80a', [String(record.errorCode)]) : '';
  return `#${record.id}｜${sourceLabel(record.source)}｜${outcomeLabel(record.outcome)}｜` +
    `${dateTimeText(record.timestamp)}｜${duration}${error}`;
}

/** 列表行，最新在前。 */
export function recordLines(records: QueryRecord[], limit: number = 40): string[] {
  if (records.length === 0) {
    return [localText('startup_text_0519')];
  }
  return records.slice(0, limit).map((record: QueryRecord): string => describeRecord(record));
}

/** 汇总行。 */
export function summaryLines(summary: HistorySummary): string[] {
  if (summary.total === 0) {
    return [localText('startup_text_0520')];
  }
  return [
    formatResource('startup_format_e969226f1a2f', [String(summary.total), String(summary.success), String(summary.failure), String(summary.unsupported)]) +
      formatResource('startup_format_206a2001625d', [String(summary.timeout), String(summary.unknown)]),
    formatResource('startup_format_1cecab3cb6e9', [String(summary.latestValidId < 0 ? localText('startup_text_0524') : summary.latestValidId)]) +
      formatResource('startup_format_b2b597c47173', [String(summary.newestAt === 0 ? localText('startup_text_0524') : dateTimeText(summary.newestAt))]) +
      formatResource('startup_format_b0b0be8a0458', [String(summary.oldestAt === 0 ? localText('startup_text_0524') : dateTimeText(summary.oldestAt))]),
    summary.expiringSoon > 0 ? formatResource('startup_format_2a33f02d1080', [String(summary.expiringSoon)]) : localText('startup_text_0528')
  ];
}

/** 前后比较行：样本不足时明确说明，不伪造差异。 */
export function comparisonLines(comparison: HistoryComparison): string[] {
  if (comparison.afterId < 0) {
    return [localText('startup_text_0529')];
  }
  if (comparison.beforeId < 0) {
    return [formatResource('startup_format_88e71f9c4642', [String(comparison.afterId), String(recordValueLabel(comparison.afterResult))])];
  }
  return [
    formatResource('startup_format_e500751111fc', [String(comparison.beforeId), String(recordValueLabel(comparison.beforeResult)), String(dateTimeText(comparison.beforeAt))]),
    formatResource('startup_format_200e5ad30abf', [String(comparison.afterId), String(recordValueLabel(comparison.afterResult)), String(dateTimeText(comparison.afterAt))]),
    comparison.changed ? localText('startup_text_0533') : localText('startup_text_0534'),
    formatResource('startup_format_571b5157a65d', [String(Math.max(0, comparison.deltaMillis))])
  ];
}

/** 导出预览：只展示前若干行，避免页面被长文本撑开。 */
export function exportPreview(text: string, limit: number = 12): string[] {
  if (text.trim().length === 0) {
    return [localText('startup_text_0536')];
  }
  const lines: string[] = text.split('\n');
  const shown: string[] = lines.slice(0, limit);
  if (lines.length > limit) {
    shown.push(formatResource('startup_format_18192b9a2e30', [String(lines.length)]));
  }
  return shown;
}

/** 校验时间范围是否自洽。 */
export function validRange(range: TimeRange): boolean {
  return Number.isFinite(range.from) && Number.isFinite(range.to) && range.from >= 0 &&
    range.to >= range.from;
}

/** One immutable-in-use scope for list, counts, latest, comparison and redacted export. */
export class HistoryScope {
  public records: QueryRecord[] = [];
  public summary: HistorySummary = new HistorySummary();
  public latestValid: QueryRecord | undefined = undefined;
  public comparison: HistoryComparison = new HistoryComparison();
  public comparisonText: string[] = [];
  public exportText: string = '';
  public generatedAt: number = 0;
}

export function scopedHistory(records: QueryRecord[], filter: HistoryFilter, now: number,
  beforeId: number = 0, afterId: number = 0): HistoryScope {
  const scope = new HistoryScope();
  scope.generatedAt = now;
  const range = rangeOf(filter.preset, now);
  scope.records = validRange(range) ? filterHistoryAdvanced(records, filter.source, filter.outcome,
    range.from, range.to).map((row: QueryRecord): QueryRecord => row.clone()) : [];
  scope.summary = summarizeHistory(scope.records, now);
  const valid = scope.records.find((row: QueryRecord): boolean => row.outcome === QueryOutcome.SUCCESS);
  scope.latestValid = valid === undefined ? undefined : valid.clone();
  const after = afterId > 0 ? scope.records.find((row: QueryRecord): boolean => row.id === afterId) : scope.records[0];
  const before = beforeId > 0 ?
    scope.records.find((row: QueryRecord): boolean => row.id === beforeId) : scope.records[1];
  if (beforeId > 0 && before === undefined || afterId > 0 && after === undefined) {
    scope.comparisonText = [localText('startup_text_0539')];
  } else if (before !== undefined && after !== undefined &&
    (before.id === after.id || before.timestamp > after.timestamp)) {
    scope.comparisonText = [localText('startup_text_0540')];
  } else {
    const selected: QueryRecord[] = [];
    if (after !== undefined) { selected.push(after); }
    if (before !== undefined) { selected.push(before); }
    scope.comparison = compareLatestRecords(selected);
    const comparison = compareSamples(before, after);
    scope.comparisonText = comparisonLines(scope.comparison);
    if (!comparison.comparable) { scope.comparisonText = scope.comparisonText.slice(0, 2); }
    scope.comparisonText.push(comparison.summary());
    scope.comparisonText.push(localText('startup_text_0541'));
  }
  scope.exportText = exportRedacted(scope.records, now);
  return scope;
}

/** Full details are local UI only; exports use exportRedacted and never reuse raw detail lines. */
export function detailLines(record: QueryRecord | undefined): string[] {
  if (record === undefined) { return [localText('startup_text_0542')]; }
  return [describeRecord(record), formatResource('startup_format_ebb315835379', [String(recordValueLabel(record.result)), String(recordValueLabel(record.supportResult)), String(recordValueLabel(record.statusResult))]),
    formatResource('startup_format_aba600cee97e', [String(record.errorCode || localText('startup_text_0524'))]), formatResource('startup_format_ddbcea641f8d', [String(record.errorMessage || localText('startup_text_0524'))])];
}

/** 按天分组计数，用于快速判断哪几天有采样。 */
export class DayCount {
  public date: string = '';
  public count: number = 0;

  constructor(date: string = '', count: number = 0) {
    this.date = date;
    this.count = count;
  }
}

export function dayCounts(records: QueryRecord[]): DayCount[] {
  const order: string[] = [];
  const counts: number[] = [];
  records.forEach((record: QueryRecord): void => {
    const date: string = dateTimeText(record.timestamp).slice(0, 5);
    const index: number = order.indexOf(date);
    if (index < 0) {
      order.push(date);
      counts.push(1);
    } else {
      counts[index] = counts[index] + 1;
    }
  });
  return order.map((date: string, index: number): DayCount => new DayCount(date, counts[index]));
}

/** 分组行。 */
export function dayCountLines(records: QueryRecord[]): string[] {
  const counts: DayCount[] = dayCounts(records);
  if (counts.length === 0) {
    return [localText('startup_text_0548')];
  }
  return counts.map((item: DayCount): string => formatResource('startup_format_22ba0b71e4be', [String(item.date), String(item.count)]));
}
