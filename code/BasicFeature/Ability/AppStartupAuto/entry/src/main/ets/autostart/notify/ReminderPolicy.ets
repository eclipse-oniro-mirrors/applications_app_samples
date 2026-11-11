/**
 * 设置提醒策略。
 *
 * 用户被引导去系统设置后可能不再回来。提醒需要克制：有频控、有静默期、有次数上限，
 * 并且只在"确实未开启"时才提醒。这里只计算"是否应该提醒"，不负责真正发通知。
 */

import { QueryOutcome, QueryRecord } from '../AutoStartupTypes';

/** 提醒渠道。 */
export enum ReminderChannel {
  BANNER = 'banner',
  TOAST = 'toast',
  DIALOG = 'dialog',
  NONE = 'none'
}

/** 提醒结论。 */
export enum ReminderVerdict {
  SHOULD_REMIND = 'shouldRemind',
  TOO_SOON = 'tooSoon',
  SILENCED = 'silenced',
  LIMIT_REACHED = 'limitReached',
  NOT_NEEDED = 'notNeeded',
  NOT_CONFIRMED = 'notConfirmed'
}

/** 提醒配置。 */
export class ReminderConfig {
  /** 两次提醒的最小间隔（毫秒）。 */
  public minIntervalMs: number = 10 * 60 * 1000;
  /** 每日最多提醒次数。 */
  public dailyLimit: number = 3;
  /** 总提醒次数上限。 */
  public totalLimit: number = 6;
  /** 是否启用静默时段。 */
  public quietHoursEnabled: boolean = true;
  /** 静默开始小时（含）。 */
  public quietStartHour: number = 22;
  /** 静默结束小时（不含）。 */
  public quietEndHour: number = 8;
  /** 只有在明确"未开启"时才提醒。 */
  public requireConfirmedOff: boolean = true;

  text(): string {
    return `间隔 ${Math.round(this.minIntervalMs / 60000)} 分钟｜每日 ${this.dailyLimit} 次｜` +
      `总计 ${this.totalLimit} 次｜静默 ${this.quietStartHour}:00-${this.quietEndHour}:00`;
  }
}

/** 默认配置。 */
export const DEFAULT_REMINDER: ReminderConfig = new ReminderConfig();

/** 提醒输入。 */
export class ReminderInput {
  /** 当前时刻。 */
  public now: number = 0;
  /** 最近一次提醒时间；0 表示从未提醒。 */
  public lastRemindedAt: number = 0;
  /** 今天已提醒次数。 */
  public todayCount: number = 0;
  /** 累计提醒次数。 */
  public totalCount: number = 0;
  /** 最新一条查询记录。 */
  public latest: QueryRecord | undefined = undefined;
  /** 用户是否主动关闭了提醒。 */
  public userSilenced: boolean = false;

  text(): string {
    return `今日 ${this.todayCount} 次｜累计 ${this.totalCount} 次`;
  }
}

/** 提醒判定结果。 */
export class ReminderDecision {
  public verdict: ReminderVerdict = ReminderVerdict.NOT_NEEDED;
  public channel: ReminderChannel = ReminderChannel.NONE;
  /** 距离下次可提醒的剩余毫秒；-1 表示不受间隔限制。 */
  public waitMillis: number = -1;
  public message: string = '';

  shouldShow(): boolean {
    return this.verdict === ReminderVerdict.SHOULD_REMIND;
  }

  text(): string {
    return `${this.verdict as string}｜${this.channel as string}｜${this.message}`;
  }
}

/** 判断某小时是否落在静默时段（支持跨零点）。 */
export function inQuietHours(hour: number, config: ReminderConfig): boolean {
  if (!config.quietHoursEnabled) {
    return false;
  }
  if (config.quietStartHour === config.quietEndHour) {
    return false;
  }
  if (config.quietStartHour < config.quietEndHour) {
    return hour >= config.quietStartHour && hour < config.quietEndHour;
  }
  return hour >= config.quietStartHour || hour < config.quietEndHour;
}

/** 记录是否明确表示"未开启"。失败与超时都不算。 */
export function confirmedOff(record: QueryRecord | undefined): boolean {
  if (record === undefined) {
    return false;
  }
  if (record.outcome !== QueryOutcome.SUCCESS) {
    return false;
  }
  return record.result.length > 0 && record.result !== '未获取' &&
    record.result.indexOf('未开启') >= 0;
}

/** 记录是否明确表示"已开启"。 */
export function confirmedOn(record: QueryRecord | undefined): boolean {
  if (record === undefined) {
    return false;
  }
  if (record.outcome !== QueryOutcome.SUCCESS) {
    return false;
  }
  return record.result.indexOf('已开启') >= 0;
}

/** 计算是否应该提醒。判定顺序即优先级。 */
export function planReminder(input: ReminderInput,
  config: ReminderConfig = DEFAULT_REMINDER): ReminderDecision {
  const decision: ReminderDecision = new ReminderDecision();
  if (input.userSilenced) {
    decision.verdict = ReminderVerdict.SILENCED;
    decision.message = '用户已关闭提醒';
    return decision;
  }
  if (confirmedOn(input.latest)) {
    decision.verdict = ReminderVerdict.NOT_NEEDED;
    decision.message = '自启已开启，无需提醒';
    return decision;
  }
  if (config.requireConfirmedOff && !confirmedOff(input.latest)) {
    decision.verdict = ReminderVerdict.NOT_CONFIRMED;
    decision.message = '尚未确认处于未开启状态，不提醒';
    return decision;
  }
  if (input.totalCount >= config.totalLimit) {
    decision.verdict = ReminderVerdict.LIMIT_REACHED;
    decision.message = `累计提醒已达 ${config.totalLimit} 次`;
    return decision;
  }
  if (input.todayCount >= config.dailyLimit) {
    decision.verdict = ReminderVerdict.LIMIT_REACHED;
    decision.message = `今日提醒已达 ${config.dailyLimit} 次`;
    return decision;
  }
  const hour: number = new Date(input.now).getHours();
  if (inQuietHours(hour, config)) {
    decision.verdict = ReminderVerdict.SILENCED;
    decision.message = '当前处于静默时段';
    return decision;
  }
  if (input.lastRemindedAt > 0) {
    const elapsed: number = Math.max(0, input.now - input.lastRemindedAt);
    if (elapsed < config.minIntervalMs) {
      decision.verdict = ReminderVerdict.TOO_SOON;
      decision.waitMillis = config.minIntervalMs - elapsed;
      decision.message = `距上次提醒不足 ${Math.round(config.minIntervalMs / 60000)} 分钟`;
      return decision;
    }
  }
  decision.verdict = ReminderVerdict.SHOULD_REMIND;
  decision.channel = input.todayCount === 0 ? ReminderChannel.BANNER : ReminderChannel.TOAST;
  decision.message = '可以提醒用户前往系统设置开启自启';
  return decision;
}

/** 提醒后推进计数。 */
export function afterRemind(input: ReminderInput): ReminderInput {
  const next: ReminderInput = new ReminderInput();
  next.now = input.now;
  next.lastRemindedAt = input.now;
  next.todayCount = input.todayCount + 1;
  next.totalCount = input.totalCount + 1;
  next.latest = input.latest;
  next.userSilenced = input.userSilenced;
  return next;
}

/** 跨天重置：把今日计数清零。 */
export function resetDaily(input: ReminderInput): ReminderInput {
  const next: ReminderInput = new ReminderInput();
  next.now = input.now;
  next.lastRemindedAt = input.lastRemindedAt;
  next.todayCount = 0;
  next.totalCount = input.totalCount;
  next.latest = input.latest;
  next.userSilenced = input.userSilenced;
  return next;
}

/** 配置自检。 */
export class ReminderAudit {
  public ok: boolean = false;
  public findings: string[] = [];

  summary(): string {
    if (this.ok) {
      return '提醒配置自洽';
    }
    return this.findings.join('；');
  }
}

export function auditReminderConfig(config: ReminderConfig = DEFAULT_REMINDER): ReminderAudit {
  const audit: ReminderAudit = new ReminderAudit();
  if (config.minIntervalMs <= 0) {
    audit.findings.push('提醒间隔必须为正');
  }
  if (config.dailyLimit <= 0 || config.totalLimit <= 0) {
    audit.findings.push('提醒次数上限必须为正');
  }
  if (config.totalLimit < config.dailyLimit) {
    audit.findings.push('总上限不应小于每日上限');
  }
  if (config.quietStartHour < 0 || config.quietStartHour > 23) {
    audit.findings.push('静默开始小时越界');
  }
  if (config.quietEndHour < 0 || config.quietEndHour > 23) {
    audit.findings.push('静默结束小时越界');
  }
  audit.ok = audit.findings.length === 0;
  return audit;
}

/** 静默时段描述。 */
export function quietText(config: ReminderConfig): string {
  if (!config.quietHoursEnabled) {
    return '未启用静默时段';
  }
  return `静默时段 ${config.quietStartHour}:00 至次日 ${config.quietEndHour}:00`;
}
