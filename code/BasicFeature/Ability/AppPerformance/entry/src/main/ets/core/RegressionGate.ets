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
 * 回归门禁。
 *
 * 阈值目录回答"这次是否达标"，门禁回答"这次能不能合入"。两者分开是因为
 * 门禁往往更严格，而且会随阶段调整策略：例如发版前禁止一切必达项失败，
 * 日常自测只拦阻断项。门禁规则独立成表，便于按场景切换。
 */

import { MetricSample } from './ThresholdCatalog';
import { message } from './TextMessages';

/** 比较方式。 */
export enum GateCompare {
  AT_MOST = 'atMost',
  AT_LEAST = 'atLeast'
}

/** 门禁级别。 */
export enum GateLevel {
  BLOCKING = 'blocking',
  WARNING = 'warning'
}

/** 级别标签。 */
export function levelLabel(level: GateLevel): string {
  return level === GateLevel.BLOCKING ? message('ap_dynamic_blocking') : message('ap_dynamic_warning');
}

/** 一条门禁规则。 */
export class GateRule {
  public ruleId: string = '';
  /** 观测键名，必须来自阈值目录。 */
  public metric: string = '';
  public compare: GateCompare = GateCompare.AT_MOST;
  public threshold: number = 0;
  public level: GateLevel = GateLevel.BLOCKING;
  /** 规则说明。 */
  private descriptionKey: string = '';

  public get description(): string {
    return message(this.descriptionKey);
  }

  public set description(value: string) {
    this.descriptionKey = value;
  }

  constructor(ruleId: string = '', metric: string = '', compare: GateCompare = GateCompare.AT_MOST,
    threshold: number = 0, level: GateLevel = GateLevel.BLOCKING, description: string = '') {
    this.ruleId = ruleId;
    this.metric = metric;
    this.compare = compare;
    this.threshold = threshold;
    this.level = level;
    this.description = description;
  }

  /** 观测值是否通过。 */
  accepts(observed: number): boolean {
    if (!Number.isFinite(observed)) {
      return false;
    }
    return this.compare === GateCompare.AT_MOST ? observed <= this.threshold :
      observed >= this.threshold;
  }

  text(): string {
    const operator: string = this.compare === GateCompare.AT_MOST ? '≤' : '≥';
    return `${this.ruleId} ${this.metric} ${operator}${this.threshold}｜${levelLabel(this.level)}`;
  }
}

/** 门禁规则表。 */
export const GATE_RULES: GateRule[] = [
  new GateRule('GT-01', 'run.failed.count', GateCompare.AT_MOST, 0, GateLevel.BLOCKING,
    'ap_dynamic_critical_steps_must_not_fail'),
  new GateRule('GT-02', 'run.total.ms', GateCompare.AT_MOST, 6000, GateLevel.BLOCKING,
    'ap_dynamic_the_maintenance_flow_must_not_exceed_6_seconds'),
  new GateRule('GT-03', 'execute.files.ms', GateCompare.AT_MOST, 2000, GateLevel.BLOCKING,
    'ap_dynamic_file_cleanup_must_not_exceed_2_seconds'),
  new GateRule('GT-04', 'execute.cache.ms', GateCompare.AT_MOST, 1500, GateLevel.BLOCKING,
    'ap_dynamic_cache_cleanup_must_not_exceed_1_5_seconds'),
  new GateRule('GT-05', 'scan.files.ms', GateCompare.AT_MOST, 400, GateLevel.WARNING,
    'ap_dynamic_excess_file_scanning_time_is_a_minor_regression'),
  new GateRule('GT-06', 'scan.cache.ms', GateCompare.AT_MOST, 300, GateLevel.WARNING,
    'ap_dynamic_excess_cache_scanning_time_is_a_minor_regression'),
  new GateRule('GT-07', 'validate.files.ms', GateCompare.AT_MOST, 150, GateLevel.WARNING,
    'ap_dynamic_inventory_validation_should_remain_lightweight'),
  new GateRule('GT-08', 'prepare.budget.ms', GateCompare.AT_MOST, 100, GateLevel.WARNING,
    'ap_dynamic_budget_calculation_should_be_pure_computation'),
  new GateRule('GT-09', 'verify.files.ms', GateCompare.AT_MOST, 200, GateLevel.WARNING,
    'ap_dynamic_verification_read_duration_should_be_stable'),
  new GateRule('GT-10', 'success.ratio', GateCompare.AT_LEAST, 95, GateLevel.BLOCKING,
    'ap_dynamic_step_success_rate_must_be_at_least_95'),
  new GateRule('GT-11', 'retry.ratio', GateCompare.AT_MOST, 10, GateLevel.WARNING,
    'ap_dynamic_retry_ratio_must_not_exceed_10'),
  new GateRule('GT-12', 'run.skipped.count', GateCompare.AT_MOST, 0, GateLevel.WARNING,
    'ap_dynamic_skipped_steps_indicate_unmet_dependencies_360'),
  new GateRule('GT-13', 'launch.cold.p90.ms', GateCompare.AT_MOST, 1200, GateLevel.BLOCKING,
    'ap_dynamic_cold_launch_p90_budget_361'),
  new GateRule('GT-14', 'launch.warm.p90.ms', GateCompare.AT_MOST, 800, GateLevel.BLOCKING,
    'ap_dynamic_warm_launch_p90_budget_362'),
  new GateRule('GT-15', 'launch.hot.p90.ms', GateCompare.AT_MOST, 400, GateLevel.BLOCKING,
    'ap_dynamic_hot_launch_p90_budget_363'),
  new GateRule('GT-16', 'launch.firstFrame.p90.ms', GateCompare.AT_MOST, 900, GateLevel.WARNING,
    'ap_dynamic_exceeding_the_first_frame_budget_produces_a_warning'),
  new GateRule('GT-17', 'launch.interactive.p90.ms', GateCompare.AT_MOST, 1500,
    GateLevel.WARNING, 'ap_dynamic_exceeding_the_interactivity_budget_produces_a_warning'),
  new GateRule('GT-18', 'load.bytes', GateCompare.AT_MOST, 268435456, GateLevel.WARNING,
    'ap_dynamic_byte_limit_per_operation'),
  new GateRule('GT-19', 'execute.batch.count', GateCompare.AT_LEAST, 1, GateLevel.WARNING,
    'ap_dynamic_at_least_one_task_batch_is_expected'),
  new GateRule('GT-20', 'cleanup.ms', GateCompare.AT_MOST, 80, GateLevel.WARNING,
    'ap_dynamic_summary_generation_should_remain_lightweight')
];

/** 规则编号列表。 */
export function ruleIds(): string[] {
  return GATE_RULES.map((rule: GateRule): string => rule.ruleId);
}

/** 按编号取规则。 */
export function ruleOf(ruleId: string): GateRule | undefined {
  return GATE_RULES.find((rule: GateRule): boolean => rule.ruleId === ruleId);
}

/** 按级别取规则。 */
export function rulesOf(level: GateLevel): GateRule[] {
  return GATE_RULES.filter((rule: GateRule): boolean => rule.level === level);
}

/** 规则涉及的指标集合。 */
export function gateMetrics(): string[] {
  const metrics: string[] = [];
  GATE_RULES.forEach((rule: GateRule): void => {
    if (metrics.indexOf(rule.metric) < 0) {
      metrics.push(rule.metric);
    }
  });
  return metrics;
}

/** 单条结果。 */
export class GateResult {
  public ruleId: string = '';
  public metric: string = '';
  public observed: number = 0;
  public threshold: number = 0;
  public level: GateLevel = GateLevel.BLOCKING;
  public passed: boolean = false;
  public missing: boolean = false;

  /** 是否阻断。 */
  blocking(): boolean {
    return !this.passed && !this.missing && this.level === GateLevel.BLOCKING;
  }

  text(): string {
    if (this.missing) {
      return message('ap_dynamic_lacks_an_observation', [this.ruleId, this.metric]);
    }
    const state: string = this.passed ? message('ap_ui_pass') : message('ap_ui_not_passed');
    return message('ap_dynamic_status_marker_251',
      [this.ruleId, this.metric, this.observed, state, this.threshold]);
  }
}

/** 门禁结论。 */
export enum GateVerdict {
  PASS = 'pass',
  WARN = 'warn',
  BLOCK = 'block',
  NOT_EVALUABLE = 'not-evaluable'
}

/** 结论标签。 */
export function verdictLabel(verdict: GateVerdict): string {
  switch (verdict) {
    case GateVerdict.PASS:
      return message('ap_dynamic_merge_allowed');
    case GateVerdict.WARN:
      return message('ap_dynamic_merge_allowed_with_warnings');
    case GateVerdict.NOT_EVALUABLE:
      return message('ap_dynamic_not_evaluable_does_not_authorize_merging');
    default:
      return message('ap_dynamic_merge_blocked');
  }
}

/** 门禁报告。 */
export class GateReport {
  public results: GateResult[] = [];

  passed(): number {
    return this.results.filter((item: GateResult): boolean => item.passed).length;
  }

  failed(): number {
    return this.results.filter((item: GateResult): boolean =>
      !item.passed && !item.missing).length;
  }

  missing(): number {
    return this.results.filter((item: GateResult): boolean => item.missing).length;
  }

  blockers(): GateResult[] {
    return this.results.filter((item: GateResult): boolean => item.blocking());
  }

  warnings(): GateResult[] {
    return this.results.filter((item: GateResult): boolean =>
      !item.passed && !item.missing && item.level === GateLevel.WARNING);
  }

  /** 结论。 */
  verdict(): GateVerdict {
    if (this.blockers().length > 0) {
      return GateVerdict.BLOCK;
    }
    if (this.results.length === 0 || this.missing() > 0) { return GateVerdict.NOT_EVALUABLE; }
    if (this.warnings().length > 0) {
      return GateVerdict.WARN;
    }
    return GateVerdict.PASS;
  }

  /** 逐行文本。 */
  text(): string {
    const lines: string[] = [message('ap_dynamic_gate_passed_not_passed_missing',
      [verdictLabel(this.verdict()), this.passed(), this.failed(), this.missing()])];
    this.results.forEach((item: GateResult): void => {
      lines.push(item.text());
    });
    return lines.join('\n');
  }
}

/** 从样本中取值。 */
function sampleOf(samples: MetricSample[], key: string): MetricSample | undefined {
  return samples.find((item: MetricSample): boolean => item.key === key);
}

/** 评估门禁。 */
export function evaluateGate(samples: MetricSample[], rules: GateRule[] = GATE_RULES): GateReport {
  const report: GateReport = new GateReport();
  rules.forEach((rule: GateRule): void => {
    const result: GateResult = new GateResult();
    result.ruleId = rule.ruleId;
    result.metric = rule.metric;
    result.threshold = rule.threshold;
    result.level = rule.level;
    const sample: MetricSample | undefined = sampleOf(samples, rule.metric);
    if (sample === undefined) {
      result.missing = true;
    } else {
      result.observed = sample.value;
      result.passed = rule.accepts(sample.value);
    }
    report.results.push(result);
  });
  return report;
}

/** 指标差值。 */
export class MetricDelta {
  public metric: string = '';
  public before: number = 0;
  public after: number = 0;

  constructor(metric: string = '', before: number = 0, after: number = 0) {
    this.metric = metric;
    this.before = before;
    this.after = after;
  }

  /** 变化百分比，正数表示变慢或变大。 */
  changePercent(): number {
    if (this.before === 0) {
      return this.after === 0 ? 0 : 100;
    }
    return Math.round(((this.after - this.before) / this.before) * 1000) / 10;
  }

  /** 是否显著变化（超过阈值百分比）。 */
  significant(thresholdPercent: number): boolean {
    return Math.abs(this.changePercent()) > thresholdPercent;
  }

  text(): string {
    return `${this.metric}: ${this.before} -> ${this.after}（${this.changePercent()}%）`;
  }
}

/** 比较两次样本，只对两次都存在的指标生成差值。 */
export function diffSamples(before: MetricSample[], after: MetricSample[]): MetricDelta[] {
  const deltas: MetricDelta[] = [];
  before.forEach((item: MetricSample): void => {
    const other: MetricSample | undefined = sampleOf(after, item.key);
    if (other !== undefined) {
      deltas.push(new MetricDelta(item.key, item.value, other.value));
    }
  });
  return deltas;
}

/** 显著退化项。 */
export function regressions(before: MetricSample[], after: MetricSample[],
  thresholdPercent: number): MetricDelta[] {
  return diffSamples(before, after).filter((delta: MetricDelta): boolean =>
    delta.changePercent() > thresholdPercent);
}

/** 门禁自检。 */
export class GateAudit {
  public ok: boolean = false;
  public findings: string[] = [];

  summary(): string {
    return this.ok ? message('ap_dynamic_gate_rule_catalog_is_consistent') :
      this.findings.join(message('ap_series_reason_separator'));
  }
}

/** 校验规则表：编号连续、指标非空、阈值非负、至少一条阻断。 */
export function auditGate(): GateAudit {
  const audit: GateAudit = new GateAudit();
  const metrics: string[] = [];
  GATE_RULES.forEach((rule: GateRule, index: number): void => {
    const expected: string = `GT-${(index + 1).toString().padStart(2, '0')}`;
    if (rule.ruleId !== expected) {
      audit.findings.push(message('ap_dynamic_nonconsecutive_id_expected_actual', [expected, rule.ruleId]));
    }
    if (rule.metric.length === 0) {
      audit.findings.push(message('ap_dynamic_missing_metric', [rule.ruleId]));
    }
    if (metrics.indexOf(rule.metric) >= 0) {
      audit.findings.push(message('ap_dynamic_duplicate_metric', [rule.ruleId]));
    }
    metrics.push(rule.metric);
    if (rule.threshold < 0) {
      audit.findings.push(message('ap_dynamic_negative_threshold', [rule.ruleId]));
    }
    if (rule.description.length === 0) {
      audit.findings.push(message('ap_dynamic_missing_description', [rule.ruleId]));
    }
  });
  if (rulesOf(GateLevel.BLOCKING).length === 0) {
    audit.findings.push(message('ap_dynamic_missing_blocking_rule'));
  }
  audit.ok = audit.findings.length === 0;
  return audit;
}

/** 规则摘要行。 */
export function ruleLines(): string[] {
  return GATE_RULES.map((rule: GateRule): string => rule.text());
}

/** 级别分布行。 */
export function levelLines(): string[] {
  const levels: GateLevel[] = [GateLevel.BLOCKING, GateLevel.WARNING];
  return levels.map((level: GateLevel): string =>
    message('ap_dynamic_entries', [levelLabel(level), rulesOf(level).length]));
}
