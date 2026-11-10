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
  value: string = '';
  label: string = '';

  constructor(value: string = '', label: string = '') {
    this.value = value;
    this.label = label;
  }
}

export const OUTCOME_OPTIONS: OutcomeOption[] = [
  new OutcomeOption('', '全部结果'),
  new OutcomeOption('success', '成功'),
  new OutcomeOption('failure', '失败'),
  new OutcomeOption('unsupported', '不支持'),
  new OutcomeOption('timeout', '超时'),
  new OutcomeOption('unknown', '未知')
];

/** 来源筛选项：空串表示不限。 */
export class SourceOption {
  value: string = '';
  label: string = '';

  constructor(value: string = '', label: string = '') {
    this.value = value;
    this.label = label;
  }
}

export const SOURCE_OPTIONS: SourceOption[] = [
  new SourceOption('', '全部来源'),
  new SourceOption(RefreshSource.INITIAL as string, '首次进入'),
  new SourceOption(RefreshSource.MANUAL as string, '手动刷新'),
  new SourceOption(RefreshSource.FOREGROUND as string, '回到前台'),
  new SourceOption(RefreshSource.SETTINGS as string, '设置后查询')
];

/** 时间范围预设。 */
export enum RangePreset {
  ALL = 'all',
  HOUR = 'hour',
  DAY = 'day',
  WEEK = 'week'
}

export class RangeOption {
  preset: RangePreset = RangePreset.ALL;
  label: string = '';

  constructor(preset: RangePreset = RangePreset.ALL, label: string = '') {
    this.preset = preset;
    this.label = label;
  }
}

export const RANGE_OPTIONS: RangeOption[] = [
  new RangeOption(RangePreset.ALL, '全部时间'),
  new RangeOption(RangePreset.HOUR, '近 1 小时'),
  new RangeOption(RangePreset.DAY, '近 24 小时'),
  new RangeOption(RangePreset.WEEK, '近 7 天')
];

/** 时间范围。 */
export class TimeRange {
  from: number = 0;
  to: number = 0;

  constructor(from: number = 0, to: number = 0) {
    this.from = from;
    this.to = to;
  }

  text(): string {
    if (this.from === 0) {
      return '全部时间';
    }
    return `${dateTimeText(this.from)} 之后`;
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
  outcome: string = '';
  source: string = '';
  preset: RangePreset = RangePreset.ALL;

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
    const outcome: string = this.outcome.length === 0 ? '全部结果' :
      outcomeLabel(this.outcome as QueryOutcome);
    const source: string = this.source.length === 0 ? '全部来源' :
      sourceLabel(this.source as RefreshSource);
    const range: TimeRange = rangeOf(this.preset, Date.now());
    return `${outcome}｜${source}｜${range.text()}`;
  }
}

/** 单条记录摘要。 */
export function describeRecord(record: QueryRecord): string {
  const duration: string = record.durationMillis > 0 ? `${record.durationMillis} ms` : '耗时缺失';
  const error: string = record.errorCode.length > 0 ? `｜错误 ${record.errorCode}` : '';
  return `#${record.id}｜${sourceLabel(record.source)}｜${outcomeLabel(record.outcome)}｜` +
    `${dateTimeText(record.timestamp)}｜${duration}${error}`;
}

/** 列表行，最新在前。 */
export function recordLines(records: QueryRecord[], limit: number = 40): string[] {
  if (records.length === 0) {
    return ['当前筛选没有记录'];
  }
  return records.slice(0, limit).map((record: QueryRecord): string => describeRecord(record));
}

/** 汇总行。 */
export function summaryLines(summary: HistorySummary): string[] {
  if (summary.total === 0) {
    return ['暂无历史记录'];
  }
  return [
    `共 ${summary.total} 条｜成功 ${summary.success}｜失败 ${summary.failure}｜不支持 ${summary.unsupported}｜` +
      `超时 ${summary.timeout}｜未知 ${summary.unknown}`,
    `最近有效 #${summary.latestValidId < 0 ? '无' : summary.latestValidId}｜` +
      `最新 ${summary.newestAt === 0 ? '无' : dateTimeText(summary.newestAt)}｜` +
      `最早 ${summary.oldestAt === 0 ? '无' : dateTimeText(summary.oldestAt)}`,
    summary.expiringSoon > 0 ? `${summary.expiringSoon} 条将在一天内到期` : '暂无到期记录'
  ];
}

/** 前后比较行：样本不足时明确说明，不伪造差异。 */
export function comparisonLines(comparison: HistoryComparison): string[] {
  if (comparison.afterId < 0) {
    return ['没有可比较的样本'];
  }
  if (comparison.beforeId < 0) {
    return [`只有一条样本 #${comparison.afterId}（${comparison.afterResult}）`];
  }
  return [
    `前 #${comparison.beforeId} ${comparison.beforeResult}（${dateTimeText(comparison.beforeAt)}）`,
    `后 #${comparison.afterId} ${comparison.afterResult}（${dateTimeText(comparison.afterAt)}）`,
    comparison.changed ? '前后结果不同，请人工确认是否与设置变更一致' : '前后结果一致',
    `间隔 ${Math.max(0, comparison.deltaMillis)} ms`
  ];
}

/** 导出预览：只展示前若干行，避免页面被长文本撑开。 */
export function exportPreview(text: string, limit: number = 12): string[] {
  if (text.trim().length === 0) {
    return ['暂无可导出内容'];
  }
  const lines: string[] = text.split('\n');
  const shown: string[] = lines.slice(0, limit);
  if (lines.length > limit) {
    shown.push(`…（共 ${lines.length} 行）`);
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
  records: QueryRecord[] = [];
  summary: HistorySummary = new HistorySummary();
  latestValid: QueryRecord | undefined = undefined;
  comparison: HistoryComparison = new HistoryComparison();
  comparisonText: string[] = [];
  exportText: string = '';
  generatedAt: number = 0;
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
  const before = beforeId > 0 ? scope.records.find((row: QueryRecord): boolean => row.id === beforeId) : scope.records[1];
  if (beforeId > 0 && before === undefined || afterId > 0 && after === undefined) {
    scope.comparisonText = ['选定记录已不在当前范围，请重选（不会引用范围外记录）'];
  } else if (before !== undefined && after !== undefined &&
    (before.id === after.id || before.timestamp > after.timestamp)) {
    scope.comparisonText = ['请选择不同记录，且“前”样本时间不得晚于“后”样本'];
  } else {
    const selected: QueryRecord[] = [];
    if (after !== undefined) { selected.push(after); }
    if (before !== undefined) { selected.push(before); }
    scope.comparison = compareLatestRecords(selected);
    const comparison = compareSamples(before, after);
    scope.comparisonText = comparisonLines(scope.comparison);
    if (!comparison.comparable) { scope.comparisonText = scope.comparisonText.slice(0, 2); }
    scope.comparisonText.push(comparison.summary());
    scope.comparisonText.push('普通历史对比不证明设置变更；设置回访请查看明确关联的session/query事实。');
  }
  scope.exportText = exportRedacted(scope.records, now);
  return scope;
}

/** Full details are local UI only; exports use exportRedacted and never reuse raw detail lines. */
export function detailLines(record: QueryRecord | undefined): string[] {
  if (record === undefined) { return ['请选择当前范围内记录查看详情']; }
  return [describeRecord(record), `结果：${record.result}；能力：${record.supportResult}；状态：${record.statusResult}`,
    `错误码：${record.errorCode || '无'}`, `本机错误说明：${record.errorMessage || '无'}`];
}

/** 按天分组计数，用于快速判断哪几天有采样。 */
export class DayCount {
  date: string = '';
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
    return ['没有采样日期'];
  }
  return counts.map((item: DayCount): string => `${item.date}：${item.count} 条`);
}
