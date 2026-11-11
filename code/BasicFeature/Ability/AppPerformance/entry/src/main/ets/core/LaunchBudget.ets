/**
 * 启动耗时预算与回归检测。
 *
 * 启动样本按"场景分组"统计：冷启动、温启动、热启动、首帧、可交互。
 * 每组有自己的预算，超预算只说明本次样本偏慢，不推断原因；回归检测比较两次
 * 采样，给出"是否变慢"的结论供页面提示。
 */

import { LaunchSample } from './Types';

/** 启动分组。 */
export class LaunchGroup {
  public key: string = '';
  public label: string = '';
  /** 分组预算（毫秒）。 */
  public budgetMs: number = 0;

  constructor(key: string = '', label: string = '', budgetMs: number = 0) {
    this.key = key;
    this.label = label;
    this.budgetMs = budgetMs;
  }

  text(): string {
    return `${this.key}（${this.label}）预算 ${this.budgetMs} ms`;
  }
}

/** 分组表。预算为示例自身设定的体验基线，不代表系统承诺。 */
export const LAUNCH_GROUPS: LaunchGroup[] = [
  new LaunchGroup('cold', '冷启动', 1200),
  new LaunchGroup('warm', '温启动', 800),
  new LaunchGroup('hot', '热启动', 400),
  new LaunchGroup('firstFrame', '首帧', 900),
  new LaunchGroup('interactive', '可交互', 1500)
];

/** AppService records content-loaded latency by the latest configuration, not cold/warm/hot.
 * The common 1500 ms budget is a sample-app baseline, not a system guarantee or first-frame metric.
 */
export const CONTENT_LOAD_GROUPS: LaunchGroup[] = [
  new LaunchGroup('启用', '启用配置·内容加载', 1500),
  new LaunchGroup('禁用', '禁用配置·内容加载', 1500),
  new LaunchGroup('初始', '初始配置·内容加载', 1500)
];

/** 分组 key 列表。 */
export function groupKeys(): string[] {
  return LAUNCH_GROUPS.map((group: LaunchGroup): string => group.key);
}

/** 按 key 取分组。 */
export function groupOf(key: string): LaunchGroup | undefined {
  return LAUNCH_GROUPS.concat(CONTENT_LOAD_GROUPS).find((group: LaunchGroup): boolean => group.key === key);
}

/** 分组标签；未知分组返回原 key。 */
export function groupLabel(key: string): string {
  const group: LaunchGroup | undefined = groupOf(key);
  return group === undefined ? key : group.label;
}

/** 构造一条样本。 */
export function sampleOf(id: string, group: string, at: number,
  contentMs: number): LaunchSample {
  return {
    id: id,
    group: group,
    at: at,
    contentMs: Math.max(0, Math.round(contentMs)),
    device: 'unit-test',
    appVersion: '1.0.0'
  };
}

/** 分位数。空集返回 0。 */
export function quantileOf(values: number[], p: number): number {
  if (values.length === 0) {
    return 0;
  }
  const sorted: number[] = values.slice();
  sorted.sort((left: number, right: number): number => left - right);
  const clamped: number = Math.min(100, Math.max(0, p));
  const position: number = (clamped / 100) * (sorted.length - 1);
  const low: number = Math.floor(position);
  const high: number = Math.ceil(position);
  if (low === high) {
    return sorted[low];
  }
  const weight: number = position - low;
  return Math.round(sorted[low] * (1 - weight) + sorted[high] * weight);
}

/** 一组样本的统计。 */
export class GroupStats {
  public key: string = '';
  public count: number = 0;
  public p50: number = 0;
  public p90: number = 0;
  public worst: number = 0;
  public mean: number = 0;

  text(): string {
    return `${groupLabel(this.key)}｜${this.count} 条｜P50 ${this.p50} ms｜P90 ${this.p90} ms｜` +
      `最差 ${this.worst} ms`;
  }
}

/** 计算单组统计。 */
export function statsFor(samples: LaunchSample[], key: string): GroupStats {
  const stats: GroupStats = new GroupStats();
  stats.key = key;
  const values: number[] = samples.filter((sample: LaunchSample): boolean =>
    sample.group === key).map((sample: LaunchSample): number => sample.contentMs);
  stats.count = values.length;
  if (values.length === 0) {
    return stats;
  }
  stats.p50 = quantileOf(values, 50);
  stats.p90 = quantileOf(values, 90);
  stats.worst = values.reduce((peak: number, value: number): number => Math.max(peak, value), 0);
  stats.mean = Math.round(values.reduce((sum: number, value: number): number => sum + value, 0) /
    values.length);
  return stats;
}

/** 全部分组统计，顺序与分组表一致。 */
export function allStats(samples: LaunchSample[], groups: LaunchGroup[] = LAUNCH_GROUPS): GroupStats[] {
  return groups.map((group: LaunchGroup): GroupStats => statsFor(samples, group.key));
}

/** 预算判定结果。 */
export class BudgetResult {
  public key: string = '';
  public label: string = '';
  public count: number = 0;
  public p90: number = 0;
  public budgetMs: number = 0;
  public passed: boolean = false;

  /** 超出预算的毫秒数；未超为 0。 */
  overshoot(): number {
    return this.passed ? 0 : Math.max(0, this.p90 - this.budgetMs);
  }

  text(): string {
    if (this.count === 0) {
      return `${this.label}：暂无样本`;
    }
    const state: string = this.passed ? '达标' : `超出 ${this.overshoot()} ms`;
    return `${this.label}：P90 ${this.p90} ms / 预算 ${this.budgetMs} ms，${state}`;
  }
}

/** 预算报告。 */
export class BudgetReport {
  public results: BudgetResult[] = [];

  /** 通过组数：只统计有样本的分组。 */
  passed(): number {
    return this.results.filter((item: BudgetResult): boolean =>
      item.count > 0 && item.passed).length;
  }

  /** 未通过组数：只统计有样本的分组。 */
  failed(): number {
    return this.results.filter((item: BudgetResult): boolean =>
      item.count > 0 && !item.passed).length;
  }

  /** 有样本的组数。 */
  measured(): number {
    return this.results.filter((item: BudgetResult): boolean => item.count > 0).length;
  }

  /** 通过率：只统计有样本的分组。 */
  passRate(): number {
    const base: number = this.measured();
    if (base === 0) {
      return 0;
    }
    return Math.round((this.passed() / base) * 1000) / 10;
  }

  /** 结论。 */
  headline(): string {
    if (this.measured() === 0) {
      return '暂无启动样本';
    }
    if (this.failed() > 0) {
      return `${this.failed()} 组超出预算`;
    }
    return '全部达标';
  }

  /** 未达标的分组。 */
  failures(): BudgetResult[] {
    return this.results.filter((item: BudgetResult): boolean => !item.passed && item.count > 0);
  }

  /** 逐行文本。 */
  text(): string {
    const lines: string[] = [`启动预算：${this.headline()}（通过率 ${this.passRate()}%）`];
    this.results.forEach((item: BudgetResult): void => {
      lines.push(item.text());
    });
    return lines.join('\n');
  }
}

/** 评估预算。无样本的分组视为通过，但不计入通过率。 */
export function evaluateBudgets(samples: LaunchSample[], groups: LaunchGroup[] = LAUNCH_GROUPS): BudgetReport {
  const report: BudgetReport = new BudgetReport();
  groups.forEach((group: LaunchGroup): void => {
    const stats: GroupStats = statsFor(samples, group.key);
    const result: BudgetResult = new BudgetResult();
    result.key = group.key;
    result.label = group.label;
    result.count = stats.count;
    result.p90 = stats.p90;
    result.budgetMs = group.budgetMs;
    result.passed = stats.count === 0 || stats.p90 <= group.budgetMs;
    report.results.push(result);
  });
  return report;
}

/** 回归结论。 */
export enum RegressionVerdict {
  IMPROVED = 'improved',
  STABLE = 'stable',
  REGRESSED = 'regressed',
  UNKNOWN = 'unknown'
}

/** 回归结论标签。 */
export function regressionLabel(verdict: RegressionVerdict): string {
  switch (verdict) {
    case RegressionVerdict.IMPROVED:
      return '变快';
    case RegressionVerdict.STABLE:
      return '持平';
    case RegressionVerdict.REGRESSED:
      return '变慢';
    default:
      return '无法比较';
  }
}

/** 单组回归结果。 */
export class RegressionResult {
  public key: string = '';
  public beforeP90: number = 0;
  public afterP90: number = 0;
  public verdict: RegressionVerdict = RegressionVerdict.UNKNOWN;

  /** 变化百分比，正值表示变慢。 */
  changePercent(): number {
    if (this.beforeP90 === 0) {
      return this.afterP90 === 0 ? 0 : 100;
    }
    return Math.round(((this.afterP90 - this.beforeP90) / this.beforeP90) * 1000) / 10;
  }

  text(): string {
    return `${groupLabel(this.key)}：${this.beforeP90} -> ${this.afterP90} ms` +
      `（${regressionLabel(this.verdict)} ${this.changePercent()}%）`;
  }
}

/** 回归报告。 */
export class RegressionReport {
  public results: RegressionResult[] = [];

  /** 变慢的分组。 */
  regressed(): RegressionResult[] {
    return this.results.filter((item: RegressionResult): boolean =>
      item.verdict === RegressionVerdict.REGRESSED);
  }

  /** 结论。 */
  headline(): string {
    if (this.results.length === 0) {
      return '没有可比样本';
    }
    const worse: number = this.regressed().length;
    if (worse > 0) {
      return `${worse} 组出现回归`;
    }
    return '没有回归';
  }

  /** 逐行文本。 */
  text(): string {
    const lines: string[] = [`回归检测：${this.headline()}`];
    this.results.forEach((item: RegressionResult): void => {
      lines.push(item.text());
    });
    return lines.join('\n');
  }
}

/** 比较两次采样。阈值以百分比表示，超过阈值才判定回归。 */
export function compareLaunches(before: LaunchSample[], after: LaunchSample[],
  thresholdPercent: number = 10): RegressionReport {
  const report: RegressionReport = new RegressionReport();
  LAUNCH_GROUPS.forEach((group: LaunchGroup): void => {
    const beforeStats: GroupStats = statsFor(before, group.key);
    const afterStats: GroupStats = statsFor(after, group.key);
    const result: RegressionResult = new RegressionResult();
    result.key = group.key;
    result.beforeP90 = beforeStats.p90;
    result.afterP90 = afterStats.p90;
    if (beforeStats.count === 0 || afterStats.count === 0) {
      result.verdict = RegressionVerdict.UNKNOWN;
    } else {
      const change: number = result.changePercent();
      if (change > thresholdPercent) {
        result.verdict = RegressionVerdict.REGRESSED;
      } else if (change < -thresholdPercent) {
        result.verdict = RegressionVerdict.IMPROVED;
      } else {
        result.verdict = RegressionVerdict.STABLE;
      }
    }
    report.results.push(result);
  });
  return report;
}

/** 分组表自检。 */
export class BudgetAudit {
  public ok: boolean = false;
  public findings: string[] = [];

  summary(): string {
    return this.ok ? '启动预算表自洽' : this.findings.join('；');
  }
}

/** 校验分组表：key 唯一、预算为正。 */
export function auditBudgets(groups: LaunchGroup[] = LAUNCH_GROUPS): BudgetAudit {
  const audit: BudgetAudit = new BudgetAudit();
  const seen: string[] = [];
  groups.forEach((group: LaunchGroup): void => {
    if (seen.indexOf(group.key) >= 0) {
      audit.findings.push(`分组重复：${group.key}`);
    }
    seen.push(group.key);
    if (group.budgetMs <= 0) {
      audit.findings.push(`预算非法：${group.key}`);
    }
    if (group.label.length === 0) {
      audit.findings.push(`缺少标签：${group.key}`);
    }
  });
  audit.ok = audit.findings.length === 0;
  return audit;
}

/** 分组摘要行。 */
export function budgetLines(groups: LaunchGroup[] = LAUNCH_GROUPS): string[] {
  return groups.map((group: LaunchGroup): string => group.text());
}
