import { ExperimentSeriesState, restoreExperimentSeries } from './ExperimentSeries';
import { ExperimentRecord, compareRecords } from './ExperimentLedger';
import { ReportTable, conditionGroupKey } from './report/ReportTable';
import { ConditionVerdict, compareRecordConditions } from './report/ConditionFingerprint';

export const SERIES_HISTORY_LIMIT: number = 10;

/** A metadata history only. Samples continue to exist solely in ExperimentLedger. */
export function restoreSeriesHistory(value: Object | undefined, current: ExperimentSeriesState | undefined,
  records: ExperimentRecord[], now: number, rejectedOwnerId: string = ''): ExperimentSeriesState[] {
  const result: ExperimentSeriesState[] = [];
  if (current !== undefined) { result.push(current); }
  if (!Array.isArray(value)) { return result; }
  (value as Object[]).slice(0, SERIES_HISTORY_LIMIT * 2).forEach((input: Object): void => {
    if (result.length >= SERIES_HISTORY_LIMIT) { return; }
    const state = restoreExperimentSeries(input, records, now);
    if (state !== undefined && state.ownerId !== rejectedOwnerId &&
      !result.some((saved: ExperimentSeriesState): boolean => saved.ownerId === state.ownerId)) { result.push(state); }
  });
  return result;
}

export function inputSeriesOwner(value: Object | undefined): string {
  if (value === undefined || value === null || typeof value !== 'object' || Array.isArray(value)) { return ''; }
  const owner = (value as Record<string, Object>)['ownerId'];
  return typeof owner === 'string' && (owner as string).length <= 160 ? owner as string : '';
}

export class SeriesGroupComparison {
  public label: string = '';
  public comparable: boolean = false;
  public leftSamples: number = 0;
  public rightSamples: number = 0;
  public leftValid: number = 0;
  public rightValid: number = 0;
  public leftP50: number = -1;
  public rightP50: number = -1;
  public leftP90: number = -1;
  public rightP90: number = -1;
  public leftMean: number = -1;
  public rightMean: number = -1;
  public deltaP50: number | undefined = undefined;
  public deltaP90: number | undefined = undefined;
  public deltaMean: number | undefined = undefined;
  public reasons: string[] = [];

  text(): string {
    if (!this.comparable) {
      return `${this.label}｜不可比：${this.reasons.join('；')}｜左 ${this.leftValid}/${this.leftSamples} 有效，` +
        `右 ${this.rightValid}/${this.rightSamples} 有效；缺失不作0`;
    }
    return `${this.label}｜同条件有效样本：左 ${this.leftValid}，右 ${this.rightValid}｜` +
      `P50 ${this.leftP50} → ${this.rightP50} ms（差 ${this.deltaP50} ms）｜` +
      `P90 ${this.leftP90} → ${this.rightP90} ms（差 ${this.deltaP90} ms）｜` +
      `均值 ${this.leftMean} → ${this.rightMean} ms（差 ${this.deltaMean} ms）`;
  }
}

export class SeriesComparison {
  public leftOwnerId: string = '';
  public rightOwnerId: string = '';
  public leftAvailable: number = 0;
  public rightAvailable: number = 0;
  public leftMissing: number = 0;
  public rightMissing: number = 0;
  public groups: SeriesGroupComparison[] = [];
  public reasons: string[] = [];

  comparableGroups(): number {
    return this.groups.filter((group: SeriesGroupComparison): boolean => group.comparable).length;
  }

  headline(): string {
    if (this.reasons.length > 0) { return `不可比：${this.reasons.join('；')}`; }
    if (this.groups.length === 0) { return '不可比：没有可用真实样本'; }
    const valid: number = this.comparableGroups();
    return valid > 0 ? `${valid} 个同条件组可比较；其余 ${this.groups.length - valid} 组不混合统计` :
      '不可比：没有双方同条件有效样本；缺失不作0';
  }

  lines(): string[] {
    const lines: string[] = [this.headline(),
      `引用：左可用 ${this.leftAvailable}、缺失 ${this.leftMissing}；右可用 ${this.rightAvailable}、缺失 ${this.rightMissing}`];
    this.groups.forEach((group: SeriesGroupComparison): void => { lines.push(group.text()); });
    lines.push('只比较真实阶段耗时；不同模式、资源或条件不合并，不推断回收量或统计显著性。');
    return lines;
  }
}

/** Use the existing grouping key, strengthened with the actual asset identity. */
function comparableGroupKey(record: ExperimentRecord): string {
  return JSON.stringify([conditionGroupKey(record), record.asset]);
}

function recordsOf(state: ExperimentSeriesState, records: ExperimentRecord[]): ExperimentRecord[] {
  return records.filter((record: ExperimentRecord): boolean => state.recordIds.indexOf(record.id) >= 0 &&
    record.workloadId === state.workloadId && record.mode === state.mode);
}

/** No new median/percentile algorithm: the existing ReportTable supplies every aggregate. */
export function compareSeriesSamples(left: ExperimentSeriesState | undefined,
  right: ExperimentSeriesState | undefined, allRecords: ExperimentRecord[]): SeriesComparison {
  const comparison = new SeriesComparison();
  if (left === undefined) { comparison.reasons.push('左侧系列不存在或元信息已淘汰'); }
  if (right === undefined) { comparison.reasons.push('右侧系列不存在或元信息已淘汰'); }
  if (left === undefined || right === undefined) { return comparison; }
  comparison.leftOwnerId = left.ownerId; comparison.rightOwnerId = right.ownerId;
  const first = recordsOf(left, allRecords); const second = recordsOf(right, allRecords);
  comparison.leftAvailable = first.length; comparison.rightAvailable = second.length;
  comparison.leftMissing = left.recordIds.length - first.length;
  comparison.rightMissing = right.recordIds.length - second.length;
  if (left.ownerId === right.ownerId) { comparison.reasons.push('请选择两个不同系列'); }
  if (left.workloadId !== right.workloadId) { comparison.reasons.push('负载不同'); }
  if (left.mode !== right.mode) { comparison.reasons.push('回收模式不同，不能作为同条件比较'); }
  if (comparison.reasons.length > 0) { return comparison; }
  const keys: string[] = [];
  first.concat(second).forEach((record: ExperimentRecord): void => {
    const key = comparableGroupKey(record);
    if (keys.indexOf(key) < 0) { keys.push(key); }
  });
  keys.forEach((key: string, index: number): void => {
    const group = new SeriesGroupComparison(); group.label = `条件对照${index + 1}`;
    const leftRecords = first.filter((record: ExperimentRecord): boolean => comparableGroupKey(record) === key);
    const rightRecords = second.filter((record: ExperimentRecord): boolean => comparableGroupKey(record) === key);
    const leftValid = leftRecords.filter((record: ExperimentRecord): boolean =>
      record.complete() && record.condition.length > 0);
    const rightValid = rightRecords.filter((record: ExperimentRecord): boolean =>
      record.complete() && record.condition.length > 0);
    group.leftSamples = leftRecords.length; group.rightSamples = rightRecords.length;
    group.leftValid = leftValid.length; group.rightValid = rightValid.length;
    if (leftValid.length === 0) { group.reasons.push('左侧无同条件有效样本'); }
    if (rightValid.length === 0) { group.reasons.push('右侧无同条件有效样本'); }
    if (group.reasons.length === 0) {
      const facts = compareRecords(leftValid[0], rightValid[0]);
      const conditions = compareRecordConditions(leftValid[0], rightValid[0]);
      if (!facts.comparable) { group.reasons.push(facts.reasons.join('；')); }
      if (conditions.verdict !== ConditionVerdict.SAME) { group.reasons.push(conditions.text()); }
      if (group.reasons.length === 0) {
        const leftRow = ReportTable.build(leftRecords).rows[0];
        const rightRow = ReportTable.build(rightRecords).rows[0];
        group.leftP50 = leftRow.p50Ms; group.rightP50 = rightRow.p50Ms;
        group.leftP90 = leftRow.p90Ms; group.rightP90 = rightRow.p90Ms;
        group.leftMean = leftRow.meanMs; group.rightMean = rightRow.meanMs;
        group.deltaP50 = rightRow.p50Ms - leftRow.p50Ms;
        group.deltaP90 = rightRow.p90Ms - leftRow.p90Ms;
        group.deltaMean = rightRow.meanMs - leftRow.meanMs;
        group.comparable = true;
      }
    }
    comparison.groups.push(group);
  });
  return comparison;
}
