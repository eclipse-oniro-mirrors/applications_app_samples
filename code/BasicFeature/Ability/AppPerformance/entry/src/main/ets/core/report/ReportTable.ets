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

/**
 * 统计表：把账本记录按「条件组」汇总成可展示、可排序、可导出为文本的表格。
 *
 * 分组契约：分组键与 ExperimentLedger.digestLedger 完全一致
 * （workloadId + mode + condition + digestBefore + beforeBytes）。这样每组的
 * P50/P90 可以直接复用 digestLedger 的结果，不需要在新代码里复制一遍分位数算法。
 *
 * 样本口径：与 digestLedger 相同——
 *   - 有效样本 = 记录 complete()（6 个阶段全部成功且结束时校验一致）且 condition 非空；
 *   - P50/P90/均值都是「阶段耗时合计」，不是回收量；
 *   - 没有有效样本时返回 -1 并在文本里写「不可评估」，绝不用 0 冒充。
 *
 * 阶段耗时表只给出 P50/均值/样本数：既有 P90 只存在于 digestLedger 内部且只对
 * 阶段合计计算，没有导出可复用的函数，因此这里不重复实现一份百分比算法；
 * 阶段级 P90 缺失在报告里显式说明，而不是用近似值填充。
 */

import { ExperimentRecord, ExperimentStage, WorkloadDigest, digestLedger, medianOf } from '../ExperimentLedger';
import { FLOW_KEYS } from '../FlowMetrics';
import { ConditionFields, ConditionSource, describeCondition, fieldsOfRecord, fingerprintOf,
  missingFieldsOf } from './ConditionFingerprint';

/** 排序键。 */
export enum ReportSort {
  SAMPLES = 'samples',
  P50 = 'p50',
  P90 = 'p90',
  MEAN = 'mean',
  FAILED = 'failed',
  WORKLOAD = 'workload'
}

/** 排序键标签。 */
export function reportSortLabel(key: ReportSort): string {
  switch (key) {
    case ReportSort.SAMPLES:
      return '样本量';
    case ReportSort.P50:
      return 'P50';
    case ReportSort.P90:
      return 'P90';
    case ReportSort.MEAN:
      return '均值';
    case ReportSort.FAILED:
      return '失败/缺失数';
    default:
      return '负载';
  }
}

/** 筛选条件：空串表示不限制。 */
export class ReportFilter {
  public workloadId: string = '';
  public mode: string = '';
  /** 只保留有有效样本的条件组。 */
  public evaluableOnly: boolean = false;

  constructor(workloadId: string = '', mode: string = '', evaluableOnly: boolean = false) {
    this.workloadId = workloadId;
    this.mode = mode;
    this.evaluableOnly = evaluableOnly;
  }

  matches(group: ConditionGroup): boolean {
    if (this.workloadId.length > 0 && group.workloadId !== this.workloadId) {
      return false;
    }
    if (this.mode.length > 0 && group.mode !== this.mode) {
      return false;
    }
    return !this.evaluableOnly || group.evaluable;
  }

  text(): string {
    const workload: string = this.workloadId.length > 0 ? this.workloadId : '全部负载';
    const mode: string = this.mode.length > 0 ? this.mode : '全部模式';
    return `${workload}｜${mode}｜${this.evaluableOnly ? '仅可评估' : '含不可评估'}`;
  }
}

/** 一个条件组内的阶段耗时行。 */
export class StageTimingRow {
  public stageKey: string = '';
  public label: string = '';
  public samples: number = 0;
  public evaluable: boolean = false;
  /** -1 表示不可评估。 */
  public p50Ms: number = -1;
  /** -1 表示不可评估。 */
  public meanMs: number = -1;

  constructor(stageKey: string = '', label: string = '', samples: number = 0,
    evaluable: boolean = false, p50Ms: number = -1, meanMs: number = -1) {
    this.stageKey = stageKey;
    this.label = label;
    this.samples = samples;
    this.evaluable = evaluable;
    this.p50Ms = p50Ms;
    this.meanMs = meanMs;
  }

  p50Text(): string {
    return this.p50Ms < 0 ? '不可评估' : `${this.p50Ms} ms`;
  }

  meanText(): string {
    return this.meanMs < 0 ? '不可评估' : `${this.meanMs} ms`;
  }

  text(): string {
    return `${this.label}｜样本 ${this.samples}｜P50 ${this.p50Text()}｜均值 ${this.meanText()}` +
      `${this.evaluable ? '' : '｜不可评估'}`;
  }
}

/** 一个条件组的汇总行。 */
export class ConditionGroup {
  /** 稳定标签（条件组1、条件组2…），排序后仍跟随本组。 */
  public label: string = '';
  public fingerprint: string = '';
  public fields: ConditionFields = new ConditionFields();
  public conditionText: string = '';
  /** 不可比原因；空串表示关键字段齐全。 */
  public unavailable: string = '';
  public workloadId: string = '';
  public workloadLabel: string = '';
  public mode: string = '';
  public samples: number = 0;
  public validSamples: number = 0;
  public failed: number = 0;
  public evaluable: boolean = false;
  /** -1 表示不可评估。 */
  public p50Ms: number = -1;
  public p90Ms: number = -1;
  public meanMs: number = -1;
  public gaps: string[] = [];
  public stageRows: StageTimingRow[] = [];

  constructor(label: string = '', fingerprint: string = '', conditionText: string = '',
    workloadId: string = '', workloadLabel: string = '', mode: string = '') {
    this.label = label;
    this.fingerprint = fingerprint;
    this.conditionText = conditionText;
    this.workloadId = workloadId;
    this.workloadLabel = workloadLabel;
    this.mode = mode;
  }

  modeLabel(): string {
    if (this.mode === 'files') {
      return '文件回收';
    }
    if (this.mode === 'modules') {
      return '模块回收';
    }
    return this.mode === 'control' ? '对照组' : '模式未记录';
  }

  p50Text(): string {
    return this.p50Ms < 0 ? '不可评估' : `${this.p50Ms} ms`;
  }

  p90Text(): string {
    return this.p90Ms < 0 ? '不可评估' : `${this.p90Ms} ms`;
  }

  meanText(): string {
    return this.meanMs < 0 ? '不可评估' : `${this.meanMs} ms`;
  }

  /** 表格行文本：可直接复制进工单或 Markdown 代码块。 */
  rowText(): string {
    const workload: string = this.workloadLabel.length > 0 ?
      `${this.workloadLabel}（${this.workloadId}）` : this.workloadId;
    const flag: string = this.unavailable.length > 0 ? `｜${this.unavailable}` : '';
    return `${this.label}｜${workload}｜${this.modeLabel()}｜样本 ${this.samples}（有效 ${this.validSamples}）｜` +
      `失败/缺失 ${this.failed}｜P50 ${this.p50Text()}｜P90 ${this.p90Text()}｜均值 ${this.meanText()}${flag}`;
  }
}

/** 分组键：与 digestLedger 的分组键保持一致，才能复用它的分位数结果。 */
export function conditionGroupKey(record: ExperimentRecord): string {
  return JSON.stringify([record.workloadId, record.mode, record.condition, record.digestBefore,
    record.beforeBytes]);
}

/** 有效样本判据：与 digestLedger 内部的 valid 判据一致。 */
function validSamplesOf(records: ExperimentRecord[]): ExperimentRecord[] {
  return records.filter((record: ExperimentRecord): boolean =>
    record.complete() && record.condition.length > 0);
}

/** 阶段耗时合计，与 digestLedger 计算 P50/P90 的口径一致。 */
function stageSum(record: ExperimentRecord): number {
  return record.stages.reduce((sum: number, stage: ExperimentStage): number =>
    sum + stage.elapsedMs, 0);
}

/** 缺失数组时返回 -1，与 medianOf 的哨兵一致。 */
function meanOf(values: number[]): number {
  if (values.length === 0) {
    return -1;
  }
  const total: number = values.reduce((sum: number, value: number): number => sum + value, 0);
  return Math.round(total / values.length);
}

/** 条件组内的阶段耗时行；无有效样本时仍保留 6 行并标记不可评估。 */
function stageRowsOf(valid: ExperimentRecord[]): StageTimingRow[] {
  return FLOW_KEYS.map((key: string): StageTimingRow => {
    const row: StageTimingRow = new StageTimingRow();
    row.stageKey = key;
    const values: number[] = [];
    let label: string = '';
    valid.forEach((record: ExperimentRecord): void => {
      const stage: ExperimentStage | undefined = record.stage(key);
      if (stage === undefined) {
        return;
      }
      if (label.length === 0 && stage.label.length > 0) {
        label = stage.label;
      }
      if (Number.isFinite(stage.elapsedMs) && stage.elapsedMs >= 0) {
        values.push(stage.elapsedMs);
      }
    });
    row.label = label.length > 0 ? label : key;
    row.samples = values.length;
    row.p50Ms = medianOf(values);
    row.meanMs = meanOf(values);
    row.evaluable = values.length > 0 && row.p50Ms >= 0;
    return row;
  });
}

/** 缺口说明：登记记录自带的缺口、未参与统计的条数，以及不可比原因。 */
function gapsOf(records: ExperimentRecord[], valid: ExperimentRecord[], group: ConditionGroup): string[] {
  const gaps: string[] = [];
  records.forEach((record: ExperimentRecord): void => {
    record.missing.forEach((text: string): void => {
      const value: string = text.trim();
      if (value.length > 0 && gaps.indexOf(value) < 0) {
        gaps.push(value);
      }
    });
  });
  const skipped: number = records.length - valid.length;
  if (skipped > 0) {
    gaps.push(`${skipped} 条记录未正常结束或缺条件，不计入 P50/P90/均值`);
  }
  if (!group.evaluable) {
    gaps.push('无有效样本：P50/P90/均值不可评估（不能用 0 代替）');
  }
  if (group.unavailable.length > 0) {
    gaps.push(group.unavailable);
  }
  return gaps;
}

/** 构造一个条件组。 */
function groupOf(same: ExperimentRecord[], label: string,
  source: ConditionSource | undefined): ConditionGroup {
  const group: ConditionGroup = new ConditionGroup();
  group.label = label;
  group.workloadId = same[0].workloadId;
  group.workloadLabel = same[0].workloadLabel;
  group.mode = same[0].mode;
  group.fields = fieldsOfRecord(same[0], source);
  group.fingerprint = fingerprintOf(group.fields);
  group.conditionText = describeCondition(group.fields);
  const missing: string[] = missingFieldsOf(group.fields);
  group.unavailable = missing.length > 0 ? `不可比：缺少 ${missing.join('、')}` : '';

  // 分组键与 digestLedger 一致，因此这里恰好得到一个汇总项。
  const digests: WorkloadDigest[] = digestLedger(same);
  const digest: WorkloadDigest | undefined = digests.length > 0 ? digests[0] : undefined;
  group.samples = digest === undefined ? same.length : digest.runs;
  group.failed = digest === undefined ? same.length : digest.failed;

  const valid: ExperimentRecord[] = validSamplesOf(same);
  group.validSamples = valid.length;
  group.p50Ms = digest === undefined ? -1 : digest.medianDuration;
  group.p90Ms = digest === undefined ? -1 : digest.p90Duration;
  group.meanMs = meanOf(valid.map((record: ExperimentRecord): number => stageSum(record)));
  group.evaluable = valid.length > 0 && group.p50Ms >= 0;
  group.stageRows = stageRowsOf(valid);
  group.gaps = gapsOf(same, valid, group);
  return group;
}

/**
 * 统计表。行由条件组构成，支持按负载/模式/可评估性筛选，按样本量或分位数排序。
 * 注意：筛选与排序都返回新表，原表不变，避免页面持有过期引用。
 */
export class ReportTable {
  public rows: ConditionGroup[] = [];

  /** 从记录构建；source 缺省时从每条记录的 condition 元组还原环境。 */
  static build(records: ExperimentRecord[],
    source: ConditionSource | undefined = undefined): ReportTable {
    const table: ReportTable = new ReportTable();
    const keys: string[] = [];
    records.forEach((record: ExperimentRecord): void => {
      const key: string = conditionGroupKey(record);
      if (keys.indexOf(key) < 0) {
        keys.push(key);
      }
    });
    keys.forEach((key: string, index: number): void => {
      const same: ExperimentRecord[] = records.filter((record: ExperimentRecord): boolean =>
        conditionGroupKey(record) === key);
      table.rows.push(groupOf(same, `条件组${index + 1}`, source));
    });
    return table;
  }

  size(): number {
    return this.rows.length;
  }

  /** 按负载/模式/可评估性筛选。 */
  filter(filter: ReportFilter): ReportTable {
    const table: ReportTable = new ReportTable();
    table.rows = this.rows.filter((group: ConditionGroup): boolean => filter.matches(group));
    return table;
  }

  /** 排序；无有效样本的行（值为 -1）始终排在末尾，不参与数值比较。 */
  sortBy(key: ReportSort, descending: boolean = false): ReportTable {
    const table: ReportTable = new ReportTable();
    table.rows = this.rows.slice();
    table.rows.sort((left: ConditionGroup, right: ConditionGroup): number => {
      if (key === ReportSort.WORKLOAD) {
        const name: number = compareText(left.workloadLabel + left.workloadId,
          right.workloadLabel + right.workloadId);
        return descending ? -name : name;
      }
      const leftValue: number = sortValueOf(left, key);
      const rightValue: number = sortValueOf(right, key);
      const leftMissing: boolean = leftValue < 0;
      const rightMissing: boolean = rightValue < 0;
      if (leftMissing !== rightMissing) {
        return leftMissing ? 1 : -1;
      }
      if (leftValue === rightValue) {
        return compareText(left.label, right.label);
      }
      const order: number = leftValue < rightValue ? -1 : 1;
      return descending ? -order : order;
    });
    return table;
  }

  /** 表头 + 逐行文本，可直接复制。 */
  text(): string {
    if (this.rows.length === 0) {
      return '没有条件组：账本为空或全部被当前筛选条件排除';
    }
    const lines: string[] = [
      '条件组\t负载\t模式\t样本\t有效\t失败/缺失\tP50\tP90\t均值\t可比性'
    ];
    this.rows.forEach((group: ConditionGroup): void => {
      lines.push(`${group.label}\t${group.workloadId}\t${group.modeLabel()}\t${group.samples}\t` +
        `${group.validSamples}\t${group.failed}\t${group.p50Text()}\t${group.p90Text()}\t` +
        `${group.meanText()}\t${group.unavailable.length > 0 ? group.unavailable : '可统计'}`);
    });
    return lines.join('\n');
  }
}

function sortValueOf(group: ConditionGroup, key: ReportSort): number {
  switch (key) {
    case ReportSort.P50:
      return group.p50Ms;
    case ReportSort.P90:
      return group.p90Ms;
    case ReportSort.MEAN:
      return group.meanMs;
    case ReportSort.FAILED:
      return group.failed;
    default:
      return group.samples;
  }
}

function compareText(left: string, right: string): number {
  if (left === right) {
    return 0;
  }
  return left < right ? -1 : 1;
}
