/**
 * 负载画像与执行参数建议。
 *
 * 同一个清理动作在 50 个文件和 5 万个文件下的行为完全不同。这里把载荷规模
 * 划分成可枚举的档位，档位决定并发数与超时，避免页面里散落魔法数字。
 */

/** 负载档位。 */
export enum LoadTier {
  IDLE = 'idle',
  LIGHT = 'light',
  NORMAL = 'normal',
  HEAVY = 'heavy',
  EXTREME = 'extreme'
}

/** 档位标签。 */
export function tierLabel(tier: LoadTier): string {
  switch (tier) {
    case LoadTier.IDLE:
      return '空载';
    case LoadTier.LIGHT:
      return '轻载';
    case LoadTier.NORMAL:
      return '常规';
    case LoadTier.HEAVY:
      return '重载';
    default:
      return '超重载';
  }
}

/** 档位序号，用于比较。 */
export function tierOrder(tier: LoadTier): number {
  switch (tier) {
    case LoadTier.IDLE:
      return 0;
    case LoadTier.LIGHT:
      return 1;
    case LoadTier.NORMAL:
      return 2;
    case LoadTier.HEAVY:
      return 3;
    default:
      return 4;
  }
}

/** 负载输入。 */
export class Workload {
  public files: number = 0;
  public bytes: number = 0;
  public modules: number = 0;

  constructor(files: number = 0, bytes: number = 0, modules: number = 0) {
    this.files = Math.max(0, Math.round(files));
    this.bytes = Math.max(0, Math.round(bytes));
    this.modules = Math.max(0, Math.round(modules));
  }

  /** 平均文件大小。 */
  averageBytes(): number {
    if (this.files === 0) {
      return 0;
    }
    return Math.round(this.bytes / this.files);
  }

  /** 是否为空载。 */
  empty(): boolean {
    return this.files === 0 && this.bytes === 0;
  }

  text(): string {
    return `${this.files} 个文件 / ${this.bytes} 字节 / ${this.modules} 个模块`;
  }
}

/** 档位边界。命中规则为"全部上限都不超"。 */
export class TierBound {
  public tier: LoadTier = LoadTier.IDLE;
  public maxFiles: number = 0;
  public maxBytes: number = 0;
  public maxModules: number = 0;

  constructor(tier: LoadTier = LoadTier.IDLE, maxFiles: number = 0, maxBytes: number = 0,
    maxModules: number = 0) {
    this.tier = tier;
    this.maxFiles = maxFiles;
    this.maxBytes = maxBytes;
    this.maxModules = maxModules;
  }

  /** 是否落在本档。 */
  covers(workload: Workload): boolean {
    return workload.files <= this.maxFiles && workload.bytes <= this.maxBytes &&
      workload.modules <= this.maxModules;
  }

  text(): string {
    return `${tierLabel(this.tier)}：≤${this.maxFiles} 文件，≤${this.maxBytes} 字节，` +
      `≤${this.maxModules} 模块`;
  }
}

/** 档位边界表，按宽松程度升序。 */
export const TIER_BOUNDS: TierBound[] = [
  new TierBound(LoadTier.IDLE, 0, 0, 0),
  new TierBound(LoadTier.LIGHT, 50, 1024 * 1024, 4),
  new TierBound(LoadTier.NORMAL, 500, 32 * 1024 * 1024, 12),
  new TierBound(LoadTier.HEAVY, 5000, 256 * 1024 * 1024, 32),
  new TierBound(LoadTier.EXTREME, Number.MAX_SAFE_INTEGER, Number.MAX_SAFE_INTEGER,
    Number.MAX_SAFE_INTEGER)
];

/** 判定档位。 */
export function classifyLoad(workload: Workload): LoadTier {
  for (const bound of TIER_BOUNDS) {
    if (bound.covers(workload)) {
      return bound.tier;
    }
  }
  return LoadTier.EXTREME;
}

/** 建议并发数：超重载反而降低并发，避免 IO 争抢。 */
export function recommendedConcurrency(tier: LoadTier): number {
  switch (tier) {
    case LoadTier.IDLE:
      return 1;
    case LoadTier.LIGHT:
      return 4;
    case LoadTier.NORMAL:
      return 6;
    case LoadTier.HEAVY:
      return 4;
    default:
      return 2;
  }
}

/** 建议超时（毫秒）。 */
export function recommendedTimeout(tier: LoadTier): number {
  switch (tier) {
    case LoadTier.IDLE:
      return 500;
    case LoadTier.LIGHT:
      return 2000;
    case LoadTier.NORMAL:
      return 5000;
    case LoadTier.HEAVY:
      return 15000;
    default:
      return 30000;
  }
}

/** 建议批量大小。 */
export function recommendedBatch(tier: LoadTier): number {
  switch (tier) {
    case LoadTier.IDLE:
      return 0;
    case LoadTier.LIGHT:
      return 16;
    case LoadTier.NORMAL:
      return 64;
    case LoadTier.HEAVY:
      return 128;
    default:
      return 256;
  }
}

/** 分批计划。 */
export class BatchPlan {
  public tier: LoadTier = LoadTier.IDLE;
  public batchSize: number = 0;
  public batchCount: number = 0;
  public concurrency: number = 1;
  public timeoutMs: number = 0;

  /** 是否无需分批。 */
  trivial(): boolean {
    return this.batchCount <= 1;
  }

  /** 说明文本。 */
  text(): string {
    return `${tierLabel(this.tier)}｜${this.batchCount} 批 × ${this.batchSize}｜并发 ` +
      `${this.concurrency}｜超时 ${this.timeoutMs} ms`;
  }
}

/** 生成分批计划。 */
export function planBatches(workload: Workload): BatchPlan {
  const plan: BatchPlan = new BatchPlan();
  plan.tier = classifyLoad(workload);
  plan.batchSize = recommendedBatch(plan.tier);
  plan.concurrency = recommendedConcurrency(plan.tier);
  plan.timeoutMs = recommendedTimeout(plan.tier);
  if (plan.batchSize <= 0) {
    plan.batchCount = workload.files === 0 ? 0 : 1;
    return plan;
  }
  plan.batchCount = Math.ceil(workload.files / plan.batchSize);
  return plan;
}

/** 单批的文件区间。 */
export class BatchRange {
  public index: number = 0;
  public start: number = 0;
  public end: number = 0;

  constructor(index: number = 0, start: number = 0, end: number = 0) {
    this.index = index;
    this.start = start;
    this.end = end;
  }

  /** 本批文件数。 */
  size(): number {
    return Math.max(0, this.end - this.start);
  }

  text(): string {
    return `第 ${this.index + 1} 批：[${this.start}, ${this.end})`;
  }
}

/** 拆出批次区间，最多返回 limit 批，便于展示。 */
export function batchRanges(plan: BatchPlan, total: number, limit: number = 8): BatchRange[] {
  const ranges: BatchRange[] = [];
  const size: number = plan.batchSize > 0 ? plan.batchSize : total;
  if (size <= 0 || total <= 0) {
    return ranges;
  }
  const count: number = Math.ceil(total / size);
  const shown: number = limit > 0 ? Math.min(count, limit) : count;
  for (let index = 0; index < shown; index++) {
    const start: number = index * size;
    ranges.push(new BatchRange(index, start, Math.min(total, start + size)));
  }
  return ranges;
}

/** 档位摘要行。 */
export function profileLines(): string[] {
  return TIER_BOUNDS.map((bound: TierBound): string => bound.text());
}

/** 一次画像结论。 */
export class ProfileConclusion {
  public workload: Workload = new Workload();
  public tier: LoadTier = LoadTier.IDLE;
  public plan: BatchPlan = new BatchPlan();

  /** 是否建议先做一次空跑。 */
  needsDryRun(): boolean {
    return tierOrder(this.tier) >= tierOrder(LoadTier.HEAVY);
  }

  /** 是否需要提示用户等待。 */
  needsProgress(): boolean {
    return tierOrder(this.tier) >= tierOrder(LoadTier.NORMAL);
  }

  text(): string {
    return `${this.workload.text()}｜${this.plan.text()}`;
  }
}

/** 完整画像。 */
export function profileOf(workload: Workload): ProfileConclusion {
  const conclusion: ProfileConclusion = new ProfileConclusion();
  conclusion.workload = workload;
  conclusion.tier = classifyLoad(workload);
  conclusion.plan = planBatches(workload);
  return conclusion;
}

/** 画像自检：边界单调递增且档位唯一。 */
export class ProfileAudit {
  public ok: boolean = false;
  public findings: string[] = [];

  summary(): string {
    return this.ok ? '负载档位表自洽' : this.findings.join('；');
  }
}

/** 校验档位表。 */
export function auditProfile(): ProfileAudit {
  const audit: ProfileAudit = new ProfileAudit();
  const seen: LoadTier[] = [];
  let lastFiles: number = -1;
  TIER_BOUNDS.forEach((bound: TierBound): void => {
    if (seen.indexOf(bound.tier) >= 0) {
      audit.findings.push(`档位重复：${tierLabel(bound.tier)}`);
    }
    seen.push(bound.tier);
    if (bound.maxFiles < lastFiles) {
      audit.findings.push(`文件上限非单调：${tierLabel(bound.tier)}`);
    }
    lastFiles = bound.maxFiles;
    if (bound.maxModules < 0) {
      audit.findings.push(`模块上限为负：${tierLabel(bound.tier)}`);
    }
  });
  if (seen.length !== 5) {
    audit.findings.push(`档位数量异常：${seen.length}`);
  }
  const tiers: LoadTier[] = [LoadTier.IDLE, LoadTier.LIGHT, LoadTier.NORMAL, LoadTier.HEAVY,
    LoadTier.EXTREME];
  tiers.forEach((tier: LoadTier): void => {
    if (recommendedConcurrency(tier) <= 0) {
      audit.findings.push(`并发数非法：${tierLabel(tier)}`);
    }
    if (recommendedTimeout(tier) <= 0) {
      audit.findings.push(`超时非法：${tierLabel(tier)}`);
    }
  });
  audit.ok = audit.findings.length === 0;
  return audit;
}
