/**
 * 归档保留策略：条数上限、天数上限、按结果差异化保留，以及"先预览、再执行"的清理。
 *
 * 契约：
 *  - 策略与清理都是纯函数：不修改入参记录，返回新数组；同一份输入 + 同一 now
 *    必得同一份预览。
 *  - 清理必须可解释：每条记录都有保留/删除理由（CleanupReason），预览给出
 *    保留数、删除数、按天数删多少、按条数删多少。
 *  - 最近一条有效样本（成功或明确失败的最新一条）永远不被清理，即使它已经
 *    超过天数或条数上限；此时预览会标记 protectedRescued，说明"本应删除、已豁免"。
 *  - 时间戳缺失或非法的记录不参与年龄/条数计算，一律保留并在预览里单独提示，
 *    不让一条坏时间悄悄吃掉可排查的数据。
 *  - 执行只依据预览的决策；预览之后新增的记录不会被删，预览中已消失的记录会
 *    记入 missingIds，而不是假装"删除成功"。
 */

import { QueryOutcome } from '../AutoStartupTypes';
import { ArchiveEntry, DAY_MS } from './ArchiveIndex';

/** 允许的最小条数上限：至少保留 1 条，避免策略把归档清成空。 */
export const MIN_RETENTION_ENTRIES: number = 1;
/** 失败样本最多额外保留的天数；再大就失去"多留一天排查"的意义。 */
export const MAX_FAILURE_BONUS_DAYS: number = 7;
/** 条数上限的硬上限，防止策略被写成"永不清理"。 */
export const MAX_RETENTION_ENTRIES: number = 100000;
/** 天数上限的硬上限（约 10 年）。 */
export const MAX_RETENTION_DAYS: number = 3650;

/** 清理决策的理由。保留与删除共用一套枚举，便于预览直接渲染。 */
export enum CleanupReason {
  /** 超过天数上限。 */
  AGE_EXPIRED = 'ageExpired',
  /** 超出条数上限，且不是最近有效样本。 */
  OVER_COUNT = 'overCount',
  /** 在天数与条数上限之内。 */
  KEPT_RECENT = 'keptRecent',
  /** 失败样本多保留的缓冲天数内，因此没被天数规则删掉。 */
  KEPT_FAILURE_GRACE = 'keptFailureGrace',
  /** 最近一条有效样本，规则豁免。 */
  KEPT_PROTECTED = 'keptProtected',
  /** 时间戳缺失或非法，不参与清理。 */
  KEPT_UNKNOWN_TIME = 'keptUnknownTime'
}

/** 理由标签。 */
export function cleanupReasonLabel(reason: CleanupReason): string {
  switch (reason) {
    case CleanupReason.AGE_EXPIRED:
      return '超过保留天数';
    case CleanupReason.OVER_COUNT:
      return '超出条数上限';
    case CleanupReason.KEPT_FAILURE_GRACE:
      return '失败样本多保留一天';
    case CleanupReason.KEPT_PROTECTED:
      return '最近有效样本，禁止删除';
    case CleanupReason.KEPT_UNKNOWN_TIME:
      return '时间未知，暂不清理';
    default:
      return '在保留范围内';
  }
}

/** 该理由是否意味着删除。 */
export function isDeleteReason(reason: CleanupReason): boolean {
  return reason === CleanupReason.AGE_EXPIRED || reason === CleanupReason.OVER_COUNT;
}

/** 保留策略。 */
export class RetentionPolicy {
  /** 归档最多保留的条数（按时间从新到旧）。 */
  maxEntries: number = 500;
  /** 记录最多保留的天数；失败样本在此之上再加 failureBonusDays。 */
  maxDays: number = 90;
  /** 失败样本的额外保留天数，默认 1 天，便于排查偶发失败。 */
  failureBonusDays: number = 1;

  constructor(maxEntries: number = 500, maxDays: number = 90, failureBonusDays: number = 1) {
    this.maxEntries = maxEntries;
    this.maxDays = maxDays;
    this.failureBonusDays = failureBonusDays;
  }

  /** 某结论的实际保留天数。只有失败样本享受额外天数，其他结论一律 maxDays。 */
  retentionDaysFor(outcome: string): number {
    const base: number = Number.isFinite(this.maxDays) ? Math.max(1, Math.round(this.maxDays)) : 1;
    if (outcome !== QueryOutcome.FAILURE) {
      return base;
    }
    const bonus: number = Number.isFinite(this.failureBonusDays) ?
      Math.max(0, Math.round(this.failureBonusDays)) : 0;
    return base + bonus;
  }

  /** 夹取到合法区间后的副本；原对象不变。 */
  normalized(): RetentionPolicy {
    return normalizePolicy(this);
  }

  /** 两个策略的生效参数是否一致。 */
  equals(other: RetentionPolicy): boolean {
    return this.maxEntries === other.maxEntries && this.maxDays === other.maxDays &&
      this.failureBonusDays === other.failureBonusDays;
  }

  /** 一行摘要。 */
  text(): string {
    return `条数上限 ${this.maxEntries}｜天数上限 ${this.maxDays} 天｜失败样本额外 ${this.failureBonusDays} 天`;
  }
}

/** 默认策略：500 条 / 90 天 / 失败多留 1 天。 */
export function defaultRetentionPolicy(): RetentionPolicy {
  return new RetentionPolicy(500, 90, 1);
}

/** 夹取整数到 [min, max]；非数值回落到 min。 */
function clampInt(value: number, min: number, max: number): number {
  if (!Number.isFinite(value)) {
    return min;
  }
  return Math.min(max, Math.max(min, Math.round(value)));
}

/**
 * 归一化策略。
 *
 * 条数下限固定为 1：允许"清理到 0"意味着归档可以在用户不知情时变成空，和
 * "不静默删除最近一条有效样本"冲突。天数与失败缓冲同样夹到硬上限。
 */
export function normalizePolicy(policy: RetentionPolicy): RetentionPolicy {
  const maxEntries: number = clampInt(policy.maxEntries, MIN_RETENTION_ENTRIES, MAX_RETENTION_ENTRIES);
  const maxDays: number = clampInt(policy.maxDays, 1, MAX_RETENTION_DAYS);
  const bonus: number = clampInt(policy.failureBonusDays, 0, MAX_FAILURE_BONUS_DAYS);
  return new RetentionPolicy(maxEntries, maxDays, bonus);
}

/** 策略说明行，供诊断页与预览头部展示。 */
export function describePolicy(policy: RetentionPolicy): string[] {
  const safe: RetentionPolicy = normalizePolicy(policy);
  const lines: string[] = [
    `最多保留 ${safe.maxEntries} 条，超出部分按时间从旧到新清理`,
    `最多保留 ${safe.maxDays} 天，更早的记录按天数清理`
  ];
  if (safe.failureBonusDays > 0) {
    lines.push(`失败样本额外保留 ${safe.failureBonusDays} 天（实际 ${safe.retentionDaysFor(QueryOutcome.FAILURE)} 天），用于排查`);
  } else {
    lines.push('失败样本与其他结果保留天数一致');
  }
  lines.push('最近一条有效样本永远保留，不受上述两条规则影响');
  return lines;
}

/** 一条记录的清理决策。 */
export class CleanupDecision {
  entryId: number = 0;
  keep: boolean = true;
  reason: CleanupReason = CleanupReason.KEPT_RECENT;
  /** 年龄（完整天数）；时间未知时为 -1。 */
  ageDays: number = -1;
  /** 该结论适用的保留天数；时间未知时为 0。 */
  retentionDays: number = 0;
  /** 具体解释，供预览逐条展示。 */
  detail: string = '';

  constructor(entryId: number = 0, keep: boolean = true,
    reason: CleanupReason = CleanupReason.KEPT_RECENT) {
    this.entryId = entryId;
    this.keep = keep;
    this.reason = reason;
  }

  describe(): string {
    const action: string = this.keep ? '保留' : '删除';
    const suffix: string = this.detail.length > 0 ? `｜${this.detail}` : '';
    return `${action} #${this.entryId}｜${cleanupReasonLabel(this.reason)}${suffix}`;
  }
}

/**
 * 清理预览。
 *
 * decisions 按时间从新到旧排列（与执行时的选择顺序一致）；未知时间的记录排在
 * 最后。preview 只描述"如果现在执行会怎样"，不持有原始记录，也不修改数据。
 */
export class CleanupPreview {
  policy: RetentionPolicy = new RetentionPolicy();
  now: number = 0;
  decisions: CleanupDecision[] = [];
  keepCount: number = 0;
  deleteCount: number = 0;
  /** 因天数规则删除的条数。 */
  agedCount: number = 0;
  /** 因条数上限删除的条数。 */
  countCutCount: number = 0;
  /** 被保护的最近有效样本序号；没有则为 -1。 */
  protectedId: number = -1;
  /** 该样本本应被删除、但被豁免。 */
  protectedRescued: boolean = false;
  /** 入参为空。 */
  emptyInput: boolean = false;
  /** 时间未知、被保留的条数。 */
  unknownTimeCount: number = 0;
  notes: string[] = [];

  /** 是否有记录会被删除。 */
  hasDeletions(): boolean {
    return this.deleteCount > 0;
  }

  /** 将被保留的序号。 */
  keptIds(): number[] {
    return this.decisions.filter((decision: CleanupDecision): boolean => decision.keep)
      .map((decision: CleanupDecision): number => decision.entryId);
  }

  /** 将被删除的序号。 */
  deletedIds(): number[] {
    return this.decisions.filter((decision: CleanupDecision): boolean => !decision.keep)
      .map((decision: CleanupDecision): number => decision.entryId);
  }

  /** 一句话摘要：保留多少、删除多少、各由哪条规则触发。 */
  summaryText(): string {
    if (this.emptyInput) {
      return '没有可清理的归档记录：保留 0 条，删除 0 条';
    }
    return `保留 ${this.keepCount} 条，删除 ${this.deleteCount} 条` +
      `（按天数 ${this.agedCount} 条，按条数 ${this.countCutCount} 条）`;
  }

  /** 摘要 + 全部说明。 */
  text(): string {
    const lines: string[] = [this.summaryText()];
    this.notes.forEach((note: string): void => {
      lines.push(note);
    });
    return lines.join('\n');
  }

  /** 逐条解释；limit<=0 表示不限。 */
  explainLines(limit: number = 30): string[] {
    const take: number = limit > 0 ? limit : this.decisions.length;
    const lines: string[] = this.decisions.slice(0, take).map((decision: CleanupDecision): string =>
      decision.describe());
    if (take < this.decisions.length) {
      lines.push(`其余 ${this.decisions.length - take} 条从略`);
    }
    return lines;
  }
}

/** 策略是否可执行：不依赖外部状态，仅检查参数是否自洽。 */
export class RetentionAudit {
  ok: boolean = false;
  findings: string[] = [];

  report(): string {
    return this.ok ? '保留策略自洽' : this.findings.join('；');
  }
}

/** 自检策略参数：整数、范围内、失败样本确实多留。 */
export function auditRetentionPolicy(policy: RetentionPolicy): RetentionAudit {
  const audit: RetentionAudit = new RetentionAudit();
  if (!Number.isInteger(policy.maxEntries) || policy.maxEntries < MIN_RETENTION_ENTRIES ||
    policy.maxEntries > MAX_RETENTION_ENTRIES) {
    audit.findings.push(`条数上限越界：${policy.maxEntries}`);
  }
  if (!Number.isInteger(policy.maxDays) || policy.maxDays < 1 || policy.maxDays > MAX_RETENTION_DAYS) {
    audit.findings.push(`天数上限越界：${policy.maxDays}`);
  }
  if (!Number.isInteger(policy.failureBonusDays) || policy.failureBonusDays < 0 ||
    policy.failureBonusDays > MAX_FAILURE_BONUS_DAYS) {
    audit.findings.push(`失败样本额外天数越界：${policy.failureBonusDays}`);
  }
  const safe: RetentionPolicy = normalizePolicy(policy);
  const successDays: number = safe.retentionDaysFor(QueryOutcome.SUCCESS);
  const failureDays: number = safe.retentionDaysFor(QueryOutcome.FAILURE);
  if (failureDays < successDays) {
    audit.findings.push('失败样本的保留天数少于成功样本');
  }
  if (safe.failureBonusDays > 0 && failureDays - successDays !== safe.failureBonusDays) {
    audit.findings.push('失败样本额外天数未生效');
  }
  if (safe.retentionDaysFor(QueryOutcome.TIMEOUT) !== successDays) {
    audit.findings.push('非失败结论不应享受额外天数');
  }
  audit.ok = audit.findings.length === 0;
  return audit;
}

/** 记录的有效时间；非法或缺失返回 0。 */
function timeOf(entry: ArchiveEntry): number {
  return Number.isFinite(entry.timestamp) && entry.timestamp > 0 ? entry.timestamp : 0;
}

/**
 * 计算清理预览。
 *
 * 规则顺序是刻意固定的：
 *  1) 先算天数：超过"该结论适用天数"的记录进入 AGE_EXPIRED；
 *  2) 再算条数：未被天数规则删掉的记录里，按时间从新到旧保留 maxEntries 条，
 *     其余进入 OVER_COUNT；
 *  3) 最近一条有效样本先占一个名额，任何一条规则都不能删它。
 * 先算天数再算条数，可以让"失败样本多留一天"在条数上限内也保持有效，而不是被
 * 条数规则顺手清掉。
 */
export function previewCleanup(entries: ArchiveEntry[], now: number,
  policy: RetentionPolicy = defaultRetentionPolicy()): CleanupPreview {
  const preview: CleanupPreview = new CleanupPreview();
  const safePolicy: RetentionPolicy = normalizePolicy(policy);
  preview.policy = safePolicy;
  const safeNow: number = Number.isFinite(now) && now > 0 ? now : 0;
  preview.now = safeNow;

  if (entries.length === 0) {
    preview.emptyInput = true;
    preview.notes.push('没有可清理的归档记录：保留 0 条，删除 0 条');
    return preview;
  }

  const ordered: ArchiveEntry[] = entries.slice();
  ordered.sort((left: ArchiveEntry, right: ArchiveEntry): number => {
    const leftTime: number = timeOf(left);
    const rightTime: number = timeOf(right);
    if (rightTime !== leftTime) {
      return rightTime - leftTime;
    }
    return right.id - left.id;
  });

  // 排序后第一条"时间有效"的有效样本就是最近一条有效样本；没有则为 -1。
  // 时间未知的记录本来就不会被清理，不占用保护名额。
  let protectedIndex: number = -1;
  for (let index = 0; index < ordered.length; index++) {
    if (timeOf(ordered[index]) > 0 && ordered[index].isValidSample()) {
      protectedIndex = index;
      break;
    }
  }

  const expired: boolean[] = ordered.map((): boolean => false);
  const knownTime: boolean[] = ordered.map((entry: ArchiveEntry): boolean => timeOf(entry) > 0);
  ordered.forEach((entry: ArchiveEntry, index: number): void => {
    if (!knownTime[index]) {
      preview.unknownTimeCount++;
      return;
    }
    if (safeNow <= 0) {
      return;
    }
    if (index === protectedIndex) {
      return;
    }
    const ageDays: number = Math.floor(Math.max(0, safeNow - timeOf(entry)) / DAY_MS);
    const retentionDays: number = safePolicy.retentionDaysFor(entry.outcome);
    if (ageDays > retentionDays) {
      expired[index] = true;
    }
  });

  // 条数上限：最近有效样本先占名额，再从新到旧填满剩余名额。
  const selected: boolean[] = ordered.map((): boolean => false);
  if (protectedIndex >= 0) {
    selected[protectedIndex] = true;
  }
  let used: number = protectedIndex >= 0 ? 1 : 0;
  ordered.forEach((entry: ArchiveEntry, index: number): void => {
    if (index === protectedIndex || !knownTime[index] || expired[index]) {
      return;
    }
    if (used >= safePolicy.maxEntries) {
      return;
    }
    selected[index] = true;
    used++;
  });

  const decisions: CleanupDecision[] = [];
  ordered.forEach((entry: ArchiveEntry, index: number): void => {
    const known: boolean = knownTime[index];
    // 时间无效时按 0 天展示，具体"已跳过天数规则"由预览说明告知。
    const ageDays: number = known ?
      (safeNow > 0 ? Math.floor(Math.max(0, safeNow - timeOf(entry)) / DAY_MS) : 0) : -1;
    const retentionDays: number = known ? safePolicy.retentionDaysFor(entry.outcome) : 0;
    let keep: boolean = true;
    let reason: CleanupReason = CleanupReason.KEPT_RECENT;
    let detail: string = '';

    if (!known) {
      keep = true;
      reason = CleanupReason.KEPT_UNKNOWN_TIME;
      detail = '时间戳缺失或非法，已保留且不计入天数/条数';
    } else if (index === protectedIndex) {
      keep = true;
      reason = CleanupReason.KEPT_PROTECTED;
      detail = ageDays > retentionDays ?
        `年龄 ${ageDays} 天已超过 ${retentionDays} 天，但作为最近有效样本豁免` :
        '最近一条有效样本，规则不删除';
    } else if (expired[index]) {
      keep = false;
      reason = CleanupReason.AGE_EXPIRED;
      detail = `年龄 ${ageDays} 天超过 ${retentionDays} 天`;
      preview.agedCount++;
    } else if (selected[index]) {
      keep = true;
      if (entry.outcome === QueryOutcome.FAILURE && ageDays > safePolicy.maxDays) {
        reason = CleanupReason.KEPT_FAILURE_GRACE;
        detail = `失败样本在 ${safePolicy.maxDays} 天基础上多保留 ${safePolicy.failureBonusDays} 天`;
      } else {
        reason = CleanupReason.KEPT_RECENT;
        detail = `年龄 ${ageDays}/${retentionDays} 天，且在 ${safePolicy.maxEntries} 条以内`;
      }
    } else {
      keep = false;
      reason = CleanupReason.OVER_COUNT;
      detail = `超出条数上限 ${safePolicy.maxEntries}，按时间从旧到新清理`;
      preview.countCutCount++;
    }

    if (keep) {
      preview.keepCount++;
    } else {
      preview.deleteCount++;
    }
    const decision: CleanupDecision = new CleanupDecision(entry.id, keep, reason);
    decision.ageDays = ageDays;
    decision.retentionDays = retentionDays;
    decision.detail = detail;
    decisions.push(decision);
  });
  preview.decisions = decisions;

  if (protectedIndex >= 0) {
    const protectedEntry: ArchiveEntry = ordered[protectedIndex];
    preview.protectedId = protectedEntry.id;
    const protectedAge: number = safeNow > 0 ?
      Math.floor(Math.max(0, safeNow - timeOf(protectedEntry)) / DAY_MS) : 0;
    const protectedLimit: number = safePolicy.retentionDaysFor(protectedEntry.outcome);
    let rank: number = 0;
    for (let index = 0; index < protectedIndex; index++) {
      if (knownTime[index]) {
        rank++;
      }
    }
    preview.protectedRescued = (safeNow > 0 && protectedAge > protectedLimit) ||
      rank >= safePolicy.maxEntries;
  }

  preview.notes.push(`天数上限 ${safePolicy.maxDays} 天` +
    (safePolicy.failureBonusDays > 0 ?
      `；失败样本额外 ${safePolicy.failureBonusDays} 天（共 ${safePolicy.retentionDaysFor(QueryOutcome.FAILURE)} 天）` :
      ''));
  preview.notes.push(`条数上限 ${safePolicy.maxEntries} 条，超出部分按时间从旧到新清理`);
  if (preview.protectedId > 0) {
    preview.notes.push(preview.protectedRescued ?
      `最近有效样本 #${preview.protectedId} 本应被清理，已豁免保留` :
      `最近有效样本 #${preview.protectedId} 已保留（不受天数/条数规则影响）`);
  }
  if (preview.unknownTimeCount > 0) {
    preview.notes.push(`${preview.unknownTimeCount} 条记录时间未知，已保留且不参与天数/条数计算`);
  }
  if (safeNow <= 0) {
    preview.notes.push('当前时间无效，已跳过天数规则，仅按条数上限清理');
  }
  return preview;
}

/** 一次清理的执行结果。 */
export class RetentionResult {
  preview: CleanupPreview = new CleanupPreview();
  kept: ArchiveEntry[] = [];
  removed: ArchiveEntry[] = [];
  /** 预览里要删、执行时已不存在的序号。 */
  missingIds: number[] = [];
  /** 预览之后才出现、因而被保留的序号。 */
  unseenIds: number[] = [];
  executed: boolean = false;

  /** 实际删除条数。 */
  deletedCount(): number {
    return this.removed.length;
  }

  /** 实际保留条数。 */
  keptCount(): number {
    return this.kept.length;
  }

  /** 执行结果是否与预览完全一致。 */
  matchesPreview(): boolean {
    return this.missingIds.length === 0 && this.unseenIds.length === 0;
  }

  text(): string {
    if (!this.executed) {
      return '未执行清理';
    }
    const lines: string[] = [
      `清理完成：删除 ${this.removed.length} 条，保留 ${this.kept.length} 条`
    ];
    if (this.missingIds.length > 0) {
      lines.push(`预览中 ${this.missingIds.length} 条待删记录在执行时已不存在`);
    }
    if (this.unseenIds.length > 0) {
      lines.push(`预览之后新增 ${this.unseenIds.length} 条记录，未纳入本次清理，已保留`);
    }
    return lines.join('\n');
  }
}

/**
 * 执行清理。
 *
 * 只在预览的决策范围内动手：
 *  - 决策为删除且记录仍在 → 删除；
 *  - 决策为保留或记录未出现在预览里 → 保留（新增记录绝不顺手删掉）；
 *  - 决策为删除但记录已不存在 → 记入 missingIds。
 * 返回新数组与克隆记录，入参不被修改。
 */
export function applyRetention(entries: ArchiveEntry[], preview: CleanupPreview): RetentionResult {
  const result: RetentionResult = new RetentionResult();
  result.preview = preview;
  result.executed = true;
  const seen: number[] = [];
  entries.forEach((entry: ArchiveEntry): void => {
    const decision: CleanupDecision | undefined = preview.decisions.find(
      (item: CleanupDecision): boolean => item.entryId === entry.id);
    if (decision === undefined) {
      result.kept.push(entry.clone());
      result.unseenIds.push(entry.id);
      seen.push(entry.id);
      return;
    }
    seen.push(entry.id);
    if (decision.keep) {
      result.kept.push(entry.clone());
    } else {
      result.removed.push(entry.clone());
    }
  });
  preview.decisions.forEach((decision: CleanupDecision): void => {
    if (seen.indexOf(decision.entryId) < 0) {
      result.missingIds.push(decision.entryId);
    }
  });
  return result;
}
