/**
 * 历史归档与保留策略。
 *
 * 历史记录不能无限增长，但"删哪些、留多久、压缩到什么程度"必须可解释：
 * 用户看到条数变少时要能回答为什么。这里把保留规则、归档分桶与压缩判定
 * 全部写成表，压缩动作只依据表输出，不在页面里临时判断。
 */

/** 保留档位。 */
export enum RetentionTier {
  RECENT = 'recent',
  WEEKLY = 'weekly',
  ARCHIVE = 'archive',
  EXPIRED = 'expired'
}

/** 档位标签。 */
export function tierLabel(tier: RetentionTier): string {
  switch (tier) {
    case RetentionTier.RECENT:
      return '近期';
    case RetentionTier.WEEKLY:
      return '近周';
    case RetentionTier.ARCHIVE:
      return '归档';
    default:
      return '待清理';
  }
}

/** 档位顺序。 */
export function tierOrder(tier: RetentionTier): number {
  switch (tier) {
    case RetentionTier.RECENT:
      return 0;
    case RetentionTier.WEEKLY:
      return 1;
    case RetentionTier.ARCHIVE:
      return 2;
    default:
      return 3;
  }
}

const HOUR: number = 3600000;
const DAY: number = 86400000;

/** 保留规则。 */
export class RetentionRule {
  ruleId: string = '';
  tier: RetentionTier = RetentionTier.RECENT;
  /** 该档位覆盖的最大年龄（毫秒）；0 表示不限。 */
  maxAgeMs: number = 0;
  /** 该档位允许保留的最大条数；0 表示不限。 */
  maxCount: number = 0;
  /** 是否参与导出。 */
  exportable: boolean = true;
  /** 是否保留完整错误信息。 */
  keepDetail: boolean = true;
  description: string = '';

  constructor(ruleId: string = '', tier: RetentionTier = RetentionTier.RECENT,
    maxAgeMs: number = 0, maxCount: number = 0, exportable: boolean = true,
    keepDetail: boolean = true, description: string = '') {
    this.ruleId = ruleId;
    this.tier = tier;
    this.maxAgeMs = maxAgeMs;
    this.maxCount = maxCount;
    this.exportable = exportable;
    this.keepDetail = keepDetail;
    this.description = description;
  }

  /** 年龄是否落在本档（不含上一档）。 */
  coversAge(ageMs: number): boolean {
    if (this.maxAgeMs <= 0) {
      return true;
    }
    return ageMs <= this.maxAgeMs;
  }

  text(): string {
    const age: string = this.maxAgeMs <= 0 ? '不限' : `${Math.round(this.maxAgeMs / HOUR)} 小时`;
    const count: string = this.maxCount <= 0 ? '不限' : `${this.maxCount} 条`;
    return `${this.ruleId} ${tierLabel(this.tier)}｜≤${age}｜≤${count}｜` +
      `${this.exportable ? '可导出' : '不导出'}`;
  }
}

/** 保留规则表，按年龄升序。 */
export const RETENTION_RULES: RetentionRule[] = [
  new RetentionRule('RT-01', RetentionTier.RECENT, HOUR, 20, true, true,
    '一小时内的记录全部保留，用于即时回溯'),
  new RetentionRule('RT-02', RetentionTier.RECENT, 6 * HOUR, 40, true, true,
    '六小时内保留到 40 条'),
  new RetentionRule('RT-03', RetentionTier.RECENT, DAY, 60, true, true,
    '一天内保留到 60 条'),
  new RetentionRule('RT-04', RetentionTier.WEEKLY, 3 * DAY, 80, true, true,
    '三天内保留到 80 条'),
  new RetentionRule('RT-05', RetentionTier.WEEKLY, 7 * DAY, 100, true, true,
    '一周内保留到 100 条'),
  new RetentionRule('RT-06', RetentionTier.WEEKLY, 14 * DAY, 120, true, true,
    '两周内保留到 120 条'),
  new RetentionRule('RT-07', RetentionTier.ARCHIVE, 30 * DAY, 150, true, false,
    '一个月内保留到 150 条，错误信息截断'),
  new RetentionRule('RT-08', RetentionTier.ARCHIVE, 60 * DAY, 200, true, false,
    '两个月内保留到 200 条，不再保留错误详情'),
  new RetentionRule('RT-09', RetentionTier.ARCHIVE, 90 * DAY, 240, true, false,
    '三个月内保留到 240 条'),
  new RetentionRule('RT-10', RetentionTier.ARCHIVE, 180 * DAY, 280, false, false,
    '半年内保留到 280 条，不再参与导出'),
  new RetentionRule('RT-11', RetentionTier.EXPIRED, 0, 0, false, false,
    '超过半年按过期处理，由用户确认后清理')
];

/** 规则编号列表。 */
export function ruleIds(): string[] {
  return RETENTION_RULES.map((rule: RetentionRule): string => rule.ruleId);
}

/** 按编号取规则。 */
export function ruleOf(ruleId: string): RetentionRule | undefined {
  return RETENTION_RULES.find((rule: RetentionRule): boolean => rule.ruleId === ruleId);
}

/** 按档位取规则。 */
export function rulesOfTier(tier: RetentionTier): RetentionRule[] {
  return RETENTION_RULES.filter((rule: RetentionRule): boolean => rule.tier === tier);
}

/**
 * 选择档位：命中第一条年龄覆盖的规则。
 *
 * 规则按年龄升序排列，因此"第一条覆盖"就是最贴身的那一档。
 */
export function tierOf(ageMs: number, now: number, timestamp: number): RetentionTier {
  const age: number = Number.isFinite(ageMs) ? Math.max(0, ageMs) : Math.max(0, now - timestamp);
  for (const rule of RETENTION_RULES) {
    if (rule.coversAge(age)) {
      return rule.tier;
    }
  }
  return RetentionTier.EXPIRED;
}

/** 记录是否可导出。 */
export function exportableAt(ageMs: number): boolean {
  const age: number = Math.max(0, ageMs);
  for (const rule of RETENTION_RULES) {
    if (rule.coversAge(age)) {
      return rule.exportable;
    }
  }
  return false;
}

/** 记录是否保留错误详情。 */
export function keepsDetailAt(ageMs: number): boolean {
  const age: number = Math.max(0, ageMs);
  for (const rule of RETENTION_RULES) {
    if (rule.coversAge(age)) {
      return rule.keepDetail;
    }
  }
  return false;
}

/** 该年龄允许保留的最大条数；0 表示不限。 */
export function limitAt(ageMs: number): number {
  const age: number = Math.max(0, ageMs);
  for (const rule of RETENTION_RULES) {
    if (rule.coversAge(age)) {
      return rule.maxCount;
    }
  }
  return 0;
}

/** 一条待归档记录的最小信息。 */
export class ArchiveRecord {
  id: number = 0;
  timestamp: number = 0;
  outcome: string = 'unknown';

  constructor(id: number = 0, timestamp: number = 0, outcome: string = 'unknown') {
    this.id = id;
    this.timestamp = timestamp;
    this.outcome = outcome;
  }

  /** 距离指定时刻的年龄。 */
  ageAt(now: number): number {
    return Math.max(0, now - this.timestamp);
  }
}

/** 归档分桶结果。 */
export class ArchivePlan {
  recent: ArchiveRecord[] = [];
  weekly: ArchiveRecord[] = [];
  archive: ArchiveRecord[] = [];
  expired: ArchiveRecord[] = [];

  /** 保留的总条数。 */
  kept(): number {
    return this.recent.length + this.weekly.length + this.archive.length;
  }

  /** 需要清理的条数。 */
  dropped(): number {
    return this.expired.length;
  }

  /** 全部条数。 */
  total(): number {
    return this.kept() + this.dropped();
  }

  /** 按档位取桶。 */
  bucketOf(tier: RetentionTier): ArchiveRecord[] {
    switch (tier) {
      case RetentionTier.RECENT:
        return this.recent;
      case RetentionTier.WEEKLY:
        return this.weekly;
      case RetentionTier.ARCHIVE:
        return this.archive;
      default:
        return this.expired;
    }
  }

  /** 各桶条数，顺序与档位一致。 */
  counts(): number[] {
    return [this.recent.length, this.weekly.length, this.archive.length, this.expired.length];
  }

  /** 摘要文本。 */
  text(): string {
    return `共 ${this.total()} 条：近期 ${this.recent.length}、近周 ${this.weekly.length}、` +
      `归档 ${this.archive.length}、待清理 ${this.expired.length}`;
  }
}

/** 按档位分桶，每桶保持时间倒序。 */
export function planArchive(records: ArchiveRecord[], now: number): ArchivePlan {
  const plan: ArchivePlan = new ArchivePlan();
  const sorted: ArchiveRecord[] = records.slice();
  sorted.sort((left: ArchiveRecord, right: ArchiveRecord): number =>
    right.timestamp - left.timestamp);
  sorted.forEach((record: ArchiveRecord): void => {
    const tier: RetentionTier = tierOf(record.ageAt(now), now, record.timestamp);
    plan.bucketOf(tier).push(record);
  });
  return plan;
}

/** 压缩判定的输入。 */
export class CompactionInput {
  tier: RetentionTier = RetentionTier.RECENT;
  count: number = 0;
  /** 估算每条占用字符数。 */
  averageChars: number = 0;
}

/** 压缩结论。 */
export enum Compaction {
  NONE = 'none',
  TRUNCATE_DETAIL = 'truncateDetail',
  DROP_OLDEST = 'dropOldest',
  DROP_ALL = 'dropAll'
}

/** 压缩标签。 */
export function compactionLabel(compaction: Compaction): string {
  switch (compaction) {
    case Compaction.TRUNCATE_DETAIL:
      return '截断错误详情';
    case Compaction.DROP_OLDEST:
      return '丢弃最旧记录';
    case Compaction.DROP_ALL:
      return '整档清理';
    default:
      return '无需压缩';
  }
}

/** 压缩决策：先截断详情，再按条数丢弃。 */
export function decideCompaction(input: CompactionInput): Compaction {
  if (input.tier === RetentionTier.EXPIRED) {
    return Compaction.DROP_ALL;
  }
  const limit: number = limitAt(input.tier === RetentionTier.RECENT ? HOUR :
    input.tier === RetentionTier.WEEKLY ? DAY : 30 * DAY);
  if (!keepsDetailAt(input.tier === RetentionTier.RECENT ? HOUR :
    input.tier === RetentionTier.WEEKLY ? DAY : 30 * DAY)) {
    return Compaction.TRUNCATE_DETAIL;
  }
  if (limit > 0 && input.count > limit) {
    return Compaction.DROP_OLDEST;
  }
  if (input.averageChars > 512 && input.count > 0) {
    return Compaction.TRUNCATE_DETAIL;
  }
  return Compaction.NONE;
}

/** 一次归档执行的结论。 */
export class CompactionReport {
  plan: ArchivePlan = new ArchivePlan();
  decisions: string[] = [];

  /** 需要用户确认的条数。 */
  needConfirm(): number {
    return this.plan.dropped();
  }

  /** 摘要文本。 */
  text(): string {
    const lines: string[] = [this.plan.text()];
    this.decisions.forEach((line: string): void => {
      lines.push(line);
    });
    if (this.needConfirm() > 0) {
      lines.push(`清理 ${this.needConfirm()} 条需要用户确认`);
    }
    return lines.join('\n');
  }
}

/** 生成归档报告。 */
export function buildCompaction(records: ArchiveRecord[], now: number): CompactionReport {
  const report: CompactionReport = new CompactionReport();
  report.plan = planArchive(records, now);
  const tiers: RetentionTier[] = [RetentionTier.RECENT, RetentionTier.WEEKLY,
    RetentionTier.ARCHIVE, RetentionTier.EXPIRED];
  tiers.forEach((tier: RetentionTier): void => {
    const bucket: ArchiveRecord[] = report.plan.bucketOf(tier);
    if (bucket.length === 0) {
      report.decisions.push(`${tierLabel(tier)}：无记录`);
      return;
    }
    const input: CompactionInput = new CompactionInput();
    input.tier = tier;
    input.count = bucket.length;
    input.averageChars = 256;
    const decision: Compaction = decideCompaction(input);
    report.decisions.push(`${tierLabel(tier)}：${bucket.length} 条 -> ` +
      `${compactionLabel(decision)}`);
  });
  return report;
}

/** 策略自检。 */
export class RetentionAudit {
  ok: boolean = false;
  public findings: string[] = [];

  summary(): string {
    return this.ok ? '保留策略自洽' : this.findings.join('；');
  }
}

/** 校验策略：编号唯一、年龄升序、条数上限单调不减、必须有清理档。 */
export function auditRetention(): RetentionAudit {
  const audit: RetentionAudit = new RetentionAudit();
  const seen: string[] = [];
  let lastAge: number = -1;
  let lastCount: number = 0;
  let catchAll: number = 0;
  RETENTION_RULES.forEach((rule: RetentionRule): void => {
    if (seen.indexOf(rule.ruleId) >= 0) {
      audit.findings.push(`规则编号重复：${rule.ruleId}`);
    }
    seen.push(rule.ruleId);
    if (rule.maxAgeMs === 0) {
      catchAll++;
    } else {
      if (rule.maxAgeMs < lastAge) {
        audit.findings.push(`年龄上限非单调：${rule.ruleId}`);
      }
      lastAge = rule.maxAgeMs;
    }
    if (rule.maxCount > 0 && rule.maxCount < lastCount) {
      audit.findings.push(`条数上限非单调：${rule.ruleId}`);
    }
    if (rule.maxCount > 0) {
      lastCount = rule.maxCount;
    }
    if (rule.description.length === 0) {
      audit.findings.push(`缺少说明：${rule.ruleId}`);
    }
  });
  if (catchAll !== 1) {
    audit.findings.push(`兜底档数量异常：${catchAll}`);
  }
  if (rulesOfTier(RetentionTier.EXPIRED).length === 0) {
    audit.findings.push('缺少过期档');
  }
  if (RETENTION_RULES[RETENTION_RULES.length - 1].maxAgeMs !== 0) {
    audit.findings.push('最后一档应为不限年龄');
  }
  audit.ok = audit.findings.length === 0;
  return audit;
}

/** 策略摘要行。 */
export function retentionLines(): string[] {
  return RETENTION_RULES.map((rule: RetentionRule): string => rule.text());
}

/** 档位标签行，供界面展示。 */
export function tierLines(): string[] {
  const tiers: RetentionTier[] = [RetentionTier.RECENT, RetentionTier.WEEKLY,
    RetentionTier.ARCHIVE, RetentionTier.EXPIRED];
  return tiers.map((tier: RetentionTier): string =>
    `${tierLabel(tier)}：${rulesOfTier(tier).length} 条规则`);
}
