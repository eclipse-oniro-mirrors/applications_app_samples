/**
 * 回归门禁。
 *
 * 阈值目录回答"这次是否达标"，门禁回答"这次能不能合入"。两者分开是因为
 * 门禁往往更严格，而且会随阶段调整策略：例如发版前禁止一切必达项失败，
 * 日常自测只拦阻断项。门禁规则独立成表，便于按场景切换。
 */

import { MetricSample } from './ThresholdCatalog';

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
  return level === GateLevel.BLOCKING ? '阻断' : '提示';
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
  public description: string = '';

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
    '关键步骤不允许失败'),
  new GateRule('GT-02', 'run.total.ms', GateCompare.AT_MOST, 6000, GateLevel.BLOCKING,
    '整轮维护不超过 6 秒'),
  new GateRule('GT-03', 'execute.files.ms', GateCompare.AT_MOST, 2000, GateLevel.BLOCKING,
    '文件清理不超过 2 秒'),
  new GateRule('GT-04', 'execute.cache.ms', GateCompare.AT_MOST, 1500, GateLevel.BLOCKING,
    '缓存清理不超过 1.5 秒'),
  new GateRule('GT-05', 'scan.files.ms', GateCompare.AT_MOST, 400, GateLevel.WARNING,
    '文件扫描超出视为轻微退化'),
  new GateRule('GT-06', 'scan.cache.ms', GateCompare.AT_MOST, 300, GateLevel.WARNING,
    '缓存扫描超出视为轻微退化'),
  new GateRule('GT-07', 'validate.files.ms', GateCompare.AT_MOST, 150, GateLevel.WARNING,
    '清单校验应保持轻量'),
  new GateRule('GT-08', 'prepare.budget.ms', GateCompare.AT_MOST, 100, GateLevel.WARNING,
    '预算计算应为纯计算'),
  new GateRule('GT-09', 'verify.files.ms', GateCompare.AT_MOST, 200, GateLevel.WARNING,
    '回读耗时应稳定'),
  new GateRule('GT-10', 'success.ratio', GateCompare.AT_LEAST, 95, GateLevel.BLOCKING,
    '步骤成功率不低于 95%'),
  new GateRule('GT-11', 'retry.ratio', GateCompare.AT_MOST, 10, GateLevel.WARNING,
    '重试比例不超过 10%'),
  new GateRule('GT-12', 'run.skipped.count', GateCompare.AT_MOST, 0, GateLevel.WARNING,
    '出现跳过说明依赖未满足'),
  new GateRule('GT-13', 'launch.cold.p90.ms', GateCompare.AT_MOST, 1200, GateLevel.BLOCKING,
    '冷启动九成样本预算'),
  new GateRule('GT-14', 'launch.warm.p90.ms', GateCompare.AT_MOST, 800, GateLevel.BLOCKING,
    '温启动九成样本预算'),
  new GateRule('GT-15', 'launch.hot.p90.ms', GateCompare.AT_MOST, 400, GateLevel.BLOCKING,
    '热启动九成样本预算'),
  new GateRule('GT-16', 'launch.firstFrame.p90.ms', GateCompare.AT_MOST, 900, GateLevel.WARNING,
    '首帧预算超出视为提示'),
  new GateRule('GT-17', 'launch.interactive.p90.ms', GateCompare.AT_MOST, 1500,
    GateLevel.WARNING, '可交互预算超出视为提示'),
  new GateRule('GT-18', 'load.bytes', GateCompare.AT_MOST, 268435456, GateLevel.WARNING,
    '单次处理字节上限'),
  new GateRule('GT-19', 'execute.batch.count', GateCompare.AT_LEAST, 1, GateLevel.WARNING,
    '至少应切出一批任务'),
  new GateRule('GT-20', 'cleanup.ms', GateCompare.AT_MOST, 80, GateLevel.WARNING,
    '摘要生成应保持轻量')
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
      return `${this.ruleId} ${this.metric} 缺少观测值`;
    }
    const state: string = this.passed ? '通过' : '未通过';
    return `${this.ruleId} ${this.metric}=${this.observed} ${state}（${this.threshold}）`;
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
      return '允许合入';
    case GateVerdict.WARN:
      return '允许合入但有提示';
    case GateVerdict.NOT_EVALUABLE:
      return '不可评估（不能据此允许合入）';
    default:
      return '禁止合入';
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
    const lines: string[] = [`门禁：${verdictLabel(this.verdict())}｜` +
      `通过 ${this.passed()}，未通过 ${this.failed()}，缺观测 ${this.missing()}`];
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
    return this.ok ? '门禁规则表自洽' : this.findings.join('；');
  }
}

/** 校验规则表：编号连续、指标非空、阈值非负、至少一条阻断。 */
export function auditGate(): GateAudit {
  const audit: GateAudit = new GateAudit();
  const metrics: string[] = [];
  GATE_RULES.forEach((rule: GateRule, index: number): void => {
    const expected: string = `GT-${(index + 1).toString().padStart(2, '0')}`;
    if (rule.ruleId !== expected) {
      audit.findings.push(`编号不连续：期望 ${expected}，实际 ${rule.ruleId}`);
    }
    if (rule.metric.length === 0) {
      audit.findings.push(`缺少指标：${rule.ruleId}`);
    }
    if (metrics.indexOf(rule.metric) >= 0) {
      audit.findings.push(`指标重复：${rule.ruleId}`);
    }
    metrics.push(rule.metric);
    if (rule.threshold < 0) {
      audit.findings.push(`阈值为负：${rule.ruleId}`);
    }
    if (rule.description.length === 0) {
      audit.findings.push(`缺少说明：${rule.ruleId}`);
    }
  });
  if (rulesOf(GateLevel.BLOCKING).length === 0) {
    audit.findings.push('缺少阻断项');
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
    `${levelLabel(level)}：${rulesOf(level).length} 条`);
}
