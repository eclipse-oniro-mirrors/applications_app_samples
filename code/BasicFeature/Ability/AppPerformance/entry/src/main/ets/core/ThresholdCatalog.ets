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
 * 维护与启动的阈值目录。
 *
 * 阈值分散在各个阶段时，最容易出现"页面写着 300 ms、导出里写着 500 ms"的情况。
 * 这里用一张表统一声明：键名、比较方式、上限、级别与依据。评估只读观测样本，
 * 不重新取数，因此页面、导出与自检看到的是同一份结论。
 */

/** 阈值类别。 */
export enum ThresholdKind {
  LATENCY = 'latency',
  COUNT = 'count',
  RATIO = 'ratio',
  SIZE = 'size'
}

/** 单位。 */
export enum ThresholdUnit {
  MILLIS = 'ms',
  COUNT = 'count',
  PERCENT = '%',
  BYTES = 'byte'
}

/** 单位文本。 */
export function unitText(unit: ThresholdUnit): string {
  switch (unit) {
    case ThresholdUnit.MILLIS:
      return 'ms';
    case ThresholdUnit.PERCENT:
      return '%';
    case ThresholdUnit.BYTES:
      return 'byte';
    default:
      return '条';
  }
}

/** 级别。 */
export enum ThresholdLevel {
  MUST = 'must',
  SHOULD = 'should',
  INFO = 'info'
}

/** 级别标签。 */
export function levelText(level: ThresholdLevel): string {
  switch (level) {
    case ThresholdLevel.MUST:
      return '必达';
    case ThresholdLevel.SHOULD:
      return '应达';
    default:
      return '参考';
  }
}

/** 比较方式。 */
export enum Limit {
  AT_MOST = 'atMost',
  AT_LEAST = 'atLeast',
  EQUALS = 'equals'
}

/** 比较标签。 */
export function limitText(limit: Limit): string {
  switch (limit) {
    case Limit.AT_MOST:
      return '不超过';
    case Limit.AT_LEAST:
      return '不少于';
    default:
      return '等于';
  }
}

/** 一条阈值。 */
export class ThresholdEntry {
  public entryId: string = '';
  /** 观测键名，必须能在样本中找到。 */
  public key: string = '';
  public kind: ThresholdKind = ThresholdKind.LATENCY;
  public unit: ThresholdUnit = ThresholdUnit.MILLIS;
  public limit: Limit = Limit.AT_MOST;
  public value: number = 0;
  public level: ThresholdLevel = ThresholdLevel.SHOULD;
  /** 依据说明。 */
  public rationale: string = '';

  constructor(entryId: string = '', key: string = '', kind: ThresholdKind = ThresholdKind.LATENCY,
    unit: ThresholdUnit = ThresholdUnit.MILLIS, limit: Limit = Limit.AT_MOST, value: number = 0,
    level: ThresholdLevel = ThresholdLevel.SHOULD, rationale: string = '') {
    this.entryId = entryId;
    this.key = key;
    this.kind = kind;
    this.unit = unit;
    this.limit = limit;
    this.value = value;
    this.level = level;
    this.rationale = rationale;
  }

  /** 规则文本。 */
  text(): string {
    return `${this.entryId} ${this.key} ${limitText(this.limit)} ${this.value}` +
      `${unitText(this.unit)}（${levelText(this.level)}）`;
  }

  /** 观测值是否达标。 */
  accepts(observed: number): boolean {
    if (!Number.isFinite(observed)) {
      return false;
    }
    switch (this.limit) {
      case Limit.AT_MOST:
        return observed <= this.value;
      case Limit.AT_LEAST:
        return observed >= this.value;
      default:
        return observed === this.value;
    }
  }
}

/** 阈值表。 */
export const THRESHOLD_CATALOG: ThresholdEntry[] = [
  new ThresholdEntry('TH-01', 'scan.files.ms', ThresholdKind.LATENCY, ThresholdUnit.MILLIS,
    Limit.AT_MOST, 400, ThresholdLevel.MUST, '文件扫描应在 400 ms 内完成'),
  new ThresholdEntry('TH-02', 'scan.cache.ms', ThresholdKind.LATENCY, ThresholdUnit.MILLIS,
    Limit.AT_MOST, 300, ThresholdLevel.MUST, '缓存扫描应在 300 ms 内完成'),
  new ThresholdEntry('TH-03', 'scan.memory.ms', ThresholdKind.LATENCY, ThresholdUnit.MILLIS,
    Limit.AT_MOST, 200, ThresholdLevel.SHOULD, '内存快照读取较快，超过说明有阻塞'),
  new ThresholdEntry('TH-04', 'validate.files.ms', ThresholdKind.LATENCY, ThresholdUnit.MILLIS,
    Limit.AT_MOST, 150, ThresholdLevel.MUST, '清单校验只做内存比较'),
  new ThresholdEntry('TH-05', 'validate.cache.ms', ThresholdKind.LATENCY, ThresholdUnit.MILLIS,
    Limit.AT_MOST, 150, ThresholdLevel.MUST, '缓存清单校验同上'),
  new ThresholdEntry('TH-06', 'prepare.budget.ms', ThresholdKind.LATENCY, ThresholdUnit.MILLIS,
    Limit.AT_MOST, 100, ThresholdLevel.SHOULD, '预算计算应为纯计算'),
  new ThresholdEntry('TH-07', 'execute.files.ms', ThresholdKind.LATENCY, ThresholdUnit.MILLIS,
    Limit.AT_MOST, 2000, ThresholdLevel.MUST, '按 500 个文件估算的清理时间'),
  new ThresholdEntry('TH-08', 'execute.cache.ms', ThresholdKind.LATENCY, ThresholdUnit.MILLIS,
    Limit.AT_MOST, 1500, ThresholdLevel.MUST, '按 500 个缓存文件估算'),
  new ThresholdEntry('TH-09', 'execute.memory.ms', ThresholdKind.LATENCY, ThresholdUnit.MILLIS,
    Limit.AT_MOST, 800, ThresholdLevel.SHOULD, '内存回收受系统调度影响'),
  new ThresholdEntry('TH-10', 'execute.batch.count', ThresholdKind.COUNT, ThresholdUnit.COUNT,
    Limit.AT_LEAST, 1, ThresholdLevel.INFO, '至少应切出一批任务'),
  new ThresholdEntry('TH-11', 'verify.files.ms', ThresholdKind.LATENCY, ThresholdUnit.MILLIS,
    Limit.AT_MOST, 200, ThresholdLevel.MUST, '回读只读元数据'),
  new ThresholdEntry('TH-12', 'verify.cache.ms', ThresholdKind.LATENCY, ThresholdUnit.MILLIS,
    Limit.AT_MOST, 200, ThresholdLevel.MUST, '回读同上'),
  new ThresholdEntry('TH-13', 'cleanup.ms', ThresholdKind.LATENCY, ThresholdUnit.MILLIS,
    Limit.AT_MOST, 80, ThresholdLevel.INFO, '摘要生成应为字符串拼接'),
  new ThresholdEntry('TH-14', 'run.total.ms', ThresholdKind.LATENCY, ThresholdUnit.MILLIS,
    Limit.AT_MOST, 6000, ThresholdLevel.MUST, '整轮维护的总预算'),
  new ThresholdEntry('TH-15', 'run.failed.count', ThresholdKind.COUNT, ThresholdUnit.COUNT,
    Limit.AT_MOST, 0, ThresholdLevel.MUST, '关键步骤不应失败'),
  new ThresholdEntry('TH-16', 'run.skipped.count', ThresholdKind.COUNT, ThresholdUnit.COUNT,
    Limit.AT_MOST, 0, ThresholdLevel.SHOULD, '跳过说明依赖未满足'),
  new ThresholdEntry('TH-17', 'launch.cold.p90.ms', ThresholdKind.LATENCY, ThresholdUnit.MILLIS,
    Limit.AT_MOST, 1200, ThresholdLevel.MUST, '冷启动九成样本的预算'),
  new ThresholdEntry('TH-18', 'launch.warm.p90.ms', ThresholdKind.LATENCY, ThresholdUnit.MILLIS,
    Limit.AT_MOST, 800, ThresholdLevel.MUST, '温启动九成样本的预算'),
  new ThresholdEntry('TH-19', 'launch.hot.p90.ms', ThresholdKind.LATENCY, ThresholdUnit.MILLIS,
    Limit.AT_MOST, 400, ThresholdLevel.MUST, '热启动九成样本的预算'),
  new ThresholdEntry('TH-20', 'launch.firstFrame.p90.ms', ThresholdKind.LATENCY,
    ThresholdUnit.MILLIS, Limit.AT_MOST, 900, ThresholdLevel.MUST, '首帧的预算'),
  new ThresholdEntry('TH-21', 'launch.interactive.p90.ms', ThresholdKind.LATENCY,
    ThresholdUnit.MILLIS, Limit.AT_MOST, 1500, ThresholdLevel.MUST, '可交互的预算'),
  new ThresholdEntry('TH-22', 'load.bytes', ThresholdKind.SIZE, ThresholdUnit.BYTES,
    Limit.AT_MOST, 268435456, ThresholdLevel.SHOULD, '单次维护处理的字节上限'),
  new ThresholdEntry('TH-23', 'success.ratio', ThresholdKind.RATIO, ThresholdUnit.PERCENT,
    Limit.AT_LEAST, 95, ThresholdLevel.MUST, '维护步骤成功率'),
  new ThresholdEntry('TH-24', 'retry.ratio', ThresholdKind.RATIO, ThresholdUnit.PERCENT,
    Limit.AT_MOST, 10, ThresholdLevel.SHOULD, '重试比例过高说明初始失败偏多')
];

/** 编号列表。 */
export function entryIds(): string[] {
  return THRESHOLD_CATALOG.map((entry: ThresholdEntry): string => entry.entryId);
}

/** 按编号取条目。 */
export function entryOf(entryId: string): ThresholdEntry | undefined {
  return THRESHOLD_CATALOG.find((entry: ThresholdEntry): boolean => entry.entryId === entryId);
}

/** 按键名取条目。 */
export function entryOfKey(key: string): ThresholdEntry | undefined {
  return THRESHOLD_CATALOG.find((entry: ThresholdEntry): boolean => entry.key === key);
}

/** 按级别筛选。 */
export function entriesOfLevel(level: ThresholdLevel): ThresholdEntry[] {
  return THRESHOLD_CATALOG.filter((entry: ThresholdEntry): boolean => entry.level === level);
}

/** 按类别筛选。 */
export function entriesOfKind(kind: ThresholdKind): ThresholdEntry[] {
  return THRESHOLD_CATALOG.filter((entry: ThresholdEntry): boolean => entry.kind === kind);
}

/** 唯一键名列表。 */
export function catalogKeys(): string[] {
  const keys: string[] = [];
  THRESHOLD_CATALOG.forEach((entry: ThresholdEntry): void => {
    if (keys.indexOf(entry.key) < 0) {
      keys.push(entry.key);
    }
  });
  return keys;
}

/** 观测样本。 */
export class MetricSample {
  public key: string = '';
  public value: number = 0;

  constructor(key: string = '', value: number = 0) {
    this.key = key;
    this.value = value;
  }
}

/** 单条判定结果。 */
export class ThresholdResult {
  public entryId: string = '';
  public key: string = '';
  public observed: number = 0;
  public threshold: number = 0;
  public level: ThresholdLevel = ThresholdLevel.SHOULD;
  public passed: boolean = false;
  public missing: boolean = false;

  /** 结论文本。 */
  text(): string {
    if (this.missing) {
      return `${this.entryId} ${this.key} 缺少观测值`;
    }
    const state: string = this.passed ? '达标' : '未达标';
    return `${this.entryId} ${this.key}=${this.observed} ${state}（阈值 ${this.threshold}）`;
  }

  /** 是否属于必达项失败。 */
  critical(): boolean {
    return !this.passed && !this.missing && this.level === ThresholdLevel.MUST;
  }
}

/** 评估报告。 */
export class ThresholdReport {
  public results: ThresholdResult[] = [];

  passed(): number {
    return this.results.filter((item: ThresholdResult): boolean => item.passed).length;
  }

  failed(): number {
    return this.results.filter((item: ThresholdResult): boolean =>
      !item.passed && !item.missing).length;
  }

  missing(): number {
    return this.results.filter((item: ThresholdResult): boolean => item.missing).length;
  }

  criticalFailures(): number {
    return this.results.filter((item: ThresholdResult): boolean => item.critical()).length;
  }

  /** 通过率：缺少观测值不计入分母。 */
  passRate(): number {
    const measured: number = this.passed() + this.failed();
    if (measured === 0) {
      return 0;
    }
    return Math.round((this.passed() / measured) * 1000) / 10;
  }

  /** 结论。 */
  headline(): string {
    if (this.results.length === 0) {
      return '没有可评估的阈值';
    }
    if (this.criticalFailures() > 0) {
      return `${this.criticalFailures()} 项必达阈值未达成`;
    }
    if (this.failed() > 0) {
      return `${this.failed()} 项参考阈值未达成`;
    }
    if (this.missing() === this.results.length) {
      return '全部缺少观测值';
    }
    return this.missing() > 0 ? '不可评估：部分指标缺少观测值' : '全部达标';
  }

  /** 未达标项。 */
  failures(): ThresholdResult[] {
    return this.results.filter((item: ThresholdResult): boolean =>
      !item.passed && !item.missing);
  }

  /** 逐行文本。 */
  text(): string {
    const lines: string[] = [`阈值评估：${this.headline()}（通过率 ${this.passRate()}%）`];
    this.results.forEach((item: ThresholdResult): void => {
      lines.push(item.text());
    });
    return lines.join('\n');
  }
}

/** 从样本中取值；找不到返回 undefined。 */
function sampleOf(samples: MetricSample[], key: string): MetricSample | undefined {
  return samples.find((item: MetricSample): boolean => item.key === key);
}

/** 评估全部阈值。 */
export function evaluateThresholds(samples: MetricSample[],
  entries: ThresholdEntry[] = THRESHOLD_CATALOG): ThresholdReport {
  const report: ThresholdReport = new ThresholdReport();
  entries.forEach((entry: ThresholdEntry): void => {
    const result: ThresholdResult = new ThresholdResult();
    result.entryId = entry.entryId;
    result.key = entry.key;
    result.threshold = entry.value;
    result.level = entry.level;
    const sample: MetricSample | undefined = sampleOf(samples, entry.key);
    if (sample === undefined) {
      result.missing = true;
      result.passed = false;
    } else {
      result.observed = sample.value;
      result.passed = entry.accepts(sample.value);
    }
    report.results.push(result);
  });
  return report;
}

/** 只评估必达项。 */
export function evaluateMust(samples: MetricSample[]): ThresholdReport {
  const full: ThresholdReport = evaluateThresholds(samples);
  const filtered: ThresholdReport = new ThresholdReport();
  filtered.results = full.results.filter((item: ThresholdResult): boolean =>
    item.level === ThresholdLevel.MUST);
  return filtered;
}

/** 从执行结果构造样本：一步一个耗时键，加总耗时与失败数。 */
export function samplesOfRun(stepDurations: MetricSample[], totalMs: number, failed: number,
  skipped: number, successRatio: number): MetricSample[] {
  const samples: MetricSample[] = [];
  stepDurations.forEach((item: MetricSample): void => {
    samples.push(new MetricSample(item.key, item.value));
  });
  samples.push(new MetricSample('run.total.ms', totalMs));
  samples.push(new MetricSample('run.failed.count', failed));
  samples.push(new MetricSample('run.skipped.count', skipped));
  samples.push(new MetricSample('success.ratio', successRatio));
  samples.push(new MetricSample('execute.batch.count', 1));
  samples.push(new MetricSample('retry.ratio', 0));
  return samples;
}

/** 目录自检。 */
export class ThresholdAudit {
  public ok: boolean = false;
  public findings: string[] = [];

  summary(): string {
    return this.ok ? '阈值目录自洽' : this.findings.join('；');
  }
}

/** 校验目录：编号连续、键名唯一、阈值非负、依据非空、级别齐全。 */
export function auditThresholds(): ThresholdAudit {
  const audit: ThresholdAudit = new ThresholdAudit();
  const seen: string[] = [];
  const keys: string[] = [];
  THRESHOLD_CATALOG.forEach((entry: ThresholdEntry, index: number): void => {
    if (seen.indexOf(entry.entryId) >= 0) {
      audit.findings.push(`编号重复：${entry.entryId}`);
    }
    seen.push(entry.entryId);
    const expected: string = `TH-${(index + 1).toString().padStart(2, '0')}`;
    if (entry.entryId !== expected) {
      audit.findings.push(`编号不连续：期望 ${expected}，实际 ${entry.entryId}`);
    }
    if (keys.indexOf(entry.key) >= 0) {
      audit.findings.push(`键名重复：${entry.key}`);
    }
    keys.push(entry.key);
    if (entry.key.length === 0) {
      audit.findings.push(`键名为空：${entry.entryId}`);
    }
    if (entry.value < 0) {
      audit.findings.push(`阈值为负：${entry.entryId}`);
    }
    if (entry.rationale.length === 0) {
      audit.findings.push(`缺少依据：${entry.entryId}`);
    }
  });
  if (entriesOfLevel(ThresholdLevel.MUST).length === 0) {
    audit.findings.push('缺少必达项');
  }
  if (entriesOfLevel(ThresholdLevel.INFO).length === 0) {
    audit.findings.push('缺少参考项');
  }
  audit.ok = audit.findings.length === 0;
  return audit;
}

/** 阈值摘要行。 */
export function thresholdLines(): string[] {
  return THRESHOLD_CATALOG.map((entry: ThresholdEntry): string => entry.text());
}

/** 级别分布行。 */
export function levelLines(): string[] {
  const levels: ThresholdLevel[] = [ThresholdLevel.MUST, ThresholdLevel.SHOULD,
    ThresholdLevel.INFO];
  return levels.map((level: ThresholdLevel): string =>
    `${levelText(level)}：${entriesOfLevel(level).length} 条`);
}

/** 类别分布行。 */
export function kindLines(): string[] {
  const kinds: ThresholdKind[] = [ThresholdKind.LATENCY, ThresholdKind.COUNT,
    ThresholdKind.RATIO, ThresholdKind.SIZE];
  return kinds.map((kind: ThresholdKind): string =>
    `${kind as string}：${entriesOfKind(kind).length} 条`);
}
