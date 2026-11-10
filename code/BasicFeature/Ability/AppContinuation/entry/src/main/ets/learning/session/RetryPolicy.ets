/**
 * 接续失败的重试策略。
 *
 * 失败原因不同，重试方式必须不同：权限问题重试没有意义，网络抖动必须退避，
 * 版本过低只能提示升级。把原因到策略的映射写成表，退避计算做成纯函数，
 * 页面只展示"下一次何时重试、为什么"。
 */

/** 失败原因。 */
export enum RetryReason {
  NETWORK = 'network',
  TIMEOUT = 'timeout',
  PERMISSION = 'permission',
  VERSION = 'version',
  DEVICE_BUSY = 'deviceBusy',
  STORAGE = 'storage',
  PAYLOAD = 'payload',
  UNKNOWN = 'unknown'
}

/** 原因标签。 */
export function reasonLabel(reason: RetryReason): string {
  switch (reason) {
    case RetryReason.NETWORK:
      return '网络异常';
    case RetryReason.TIMEOUT:
      return '请求超时';
    case RetryReason.PERMISSION:
      return '权限不足';
    case RetryReason.VERSION:
      return '版本不兼容';
    case RetryReason.DEVICE_BUSY:
      return '设备繁忙';
    case RetryReason.STORAGE:
      return '存储异常';
    case RetryReason.PAYLOAD:
      return '载荷非法';
    default:
      return '未知原因';
  }
}

/** 退避方式。 */
export enum Backoff {
  NONE = 'none',
  FIXED = 'fixed',
  LINEAR = 'linear',
  EXPONENTIAL = 'exponential'
}

/** 退避标签。 */
export function backoffLabel(backoff: Backoff): string {
  switch (backoff) {
    case Backoff.NONE:
      return '不重试';
    case Backoff.FIXED:
      return '固定间隔';
    case Backoff.LINEAR:
      return '线性递增';
    default:
      return '指数退避';
  }
}

/** 重试规则。 */
export class RetryRule {
  ruleId: string = '';
  reason: RetryReason = RetryReason.UNKNOWN;
  backoff: Backoff = Backoff.NONE;
  /** 首次延迟（毫秒）。 */
  baseDelayMs: number = 0;
  /** 最大尝试次数，含首次。 */
  maxAttempts: number = 1;
  /** 延迟上限（毫秒）。 */
  capMs: number = 0;
  /** 是否需要用户先操作再重试。 */
  requiresAction: boolean = false;
  description: string = '';

  constructor(ruleId: string = '', reason: RetryReason = RetryReason.UNKNOWN,
    backoff: Backoff = Backoff.NONE, baseDelayMs: number = 0, maxAttempts: number = 1,
    capMs: number = 0, requiresAction: boolean = false, description: string = '') {
    this.ruleId = ruleId;
    this.reason = reason;
    this.backoff = backoff;
    this.baseDelayMs = baseDelayMs;
    this.maxAttempts = maxAttempts;
    this.capMs = capMs;
    this.requiresAction = requiresAction;
    this.description = description;
  }

  /** 是否允许重试。 */
  retryable(): boolean {
    return this.backoff !== Backoff.NONE && this.maxAttempts > 1;
  }

  text(): string {
    return `${this.ruleId} ${reasonLabel(this.reason)}｜${backoffLabel(this.backoff)}｜` +
      `最多 ${this.maxAttempts} 次｜${this.baseDelayMs} ms 起`;
  }
}

/** 规则表。 */
export const RETRY_RULES: RetryRule[] = [
  new RetryRule('RR-01', RetryReason.NETWORK, Backoff.EXPONENTIAL, 200, 4, 4000, false,
    '网络抖动按指数退避，最多四次'),
  new RetryRule('RR-02', RetryReason.NETWORK, Backoff.FIXED, 500, 2, 500, false,
    '已知弱网环境下改为固定间隔的一次重试'),
  new RetryRule('RR-03', RetryReason.TIMEOUT, Backoff.LINEAR, 300, 3, 2000, false,
    '超时按线性递增，避免连续打满'),
  new RetryRule('RR-04', RetryReason.TIMEOUT, Backoff.NONE, 0, 1, 0, false,
    '长耗时任务超时后不再自动重试，交由用户决定'),
  new RetryRule('RR-05', RetryReason.PERMISSION, Backoff.NONE, 0, 1, 0, true,
    '权限不足必须由用户授权后才能重试'),
  new RetryRule('RR-06', RetryReason.VERSION, Backoff.NONE, 0, 1, 0, true,
    '版本不兼容需升级应用或系统'),
  new RetryRule('RR-07', RetryReason.DEVICE_BUSY, Backoff.FIXED, 800, 3, 800, false,
    '设备繁忙固定间隔重试三次'),
  new RetryRule('RR-08', RetryReason.DEVICE_BUSY, Backoff.LINEAR, 400, 2, 1200, false,
    '轻度繁忙时线性递增两次'),
  new RetryRule('RR-09', RetryReason.STORAGE, Backoff.FIXED, 1000, 2, 1000, false,
    '存储写入失败等待一秒后重试'),
  new RetryRule('RR-10', RetryReason.STORAGE, Backoff.NONE, 0, 1, 0, true,
    '存储空间不足需用户清理后重试'),
  new RetryRule('RR-11', RetryReason.PAYLOAD, Backoff.NONE, 0, 1, 0, true,
    '载荷非法必须修改内容后重试'),
  new RetryRule('RR-12', RetryReason.UNKNOWN, Backoff.LINEAR, 500, 2, 1000, false,
    '未知原因只做一次保守重试'),
  new RetryRule('RR-13', RetryReason.NETWORK, Backoff.EXPONENTIAL, 100, 5, 3200, false,
    '后台接续场景可多用一次退避'),
  new RetryRule('RR-14', RetryReason.TIMEOUT, Backoff.EXPONENTIAL, 250, 4, 2000, false,
    '前台上传场景使用指数退避'),
  new RetryRule('RR-15', RetryReason.DEVICE_BUSY, Backoff.EXPONENTIAL, 600, 3, 2400, false,
    '重载设备使用指数退避'),
  new RetryRule('RR-16', RetryReason.STORAGE, Backoff.LINEAR, 300, 3, 900, false,
    '临时不可写时线性递增'),
  new RetryRule('RR-17', RetryReason.UNKNOWN, Backoff.NONE, 0, 1, 0, true,
    '连续未知失败后停止自动重试'),
  new RetryRule('RR-18', RetryReason.VERSION, Backoff.NONE, 0, 1, 0, false,
    '仅记录不重试，由页面提示'),
  new RetryRule('RR-19', RetryReason.PERMISSION, Backoff.FIXED, 1500, 2, 1500, true,
    '授权返回后可做一次确认性重试'),
  new RetryRule('RR-20', RetryReason.PAYLOAD, Backoff.NONE, 0, 1, 0, false,
    '载荷问题不重试，直接给出校验结论')
];

/** 规则编号。 */
export function ruleIds(): string[] {
  return RETRY_RULES.map((rule: RetryRule): string => rule.ruleId);
}

/** 按编号取规则。 */
export function ruleOf(ruleId: string): RetryRule | undefined {
  return RETRY_RULES.find((rule: RetryRule): boolean => rule.ruleId === ruleId);
}

/** 按原因取全部规则。 */
export function rulesOf(reason: RetryReason): RetryRule[] {
  return RETRY_RULES.filter((rule: RetryRule): boolean => rule.reason === reason);
}

/** 取默认规则：首个命中该原因的规则。 */
export function defaultRule(reason: RetryReason): RetryRule {
  const hit: RetryRule | undefined = rulesOf(reason)[0];
  if (hit !== undefined) {
    return hit;
  }
  return new RetryRule('RR-00', RetryReason.UNKNOWN, Backoff.NONE, 0, 1, 0, false, '无匹配规则');
}

/**
 * 计算第 attempt 次重试前的等待时间（attempt 从 1 开始）。
 *
 * 返回 0 表示不重试。所有结果都受 capMs 限制。
 */
export function delayOf(rule: RetryRule, attempt: number): number {
  if (!rule.retryable() || attempt < 1 || attempt >= rule.maxAttempts) {
    return 0;
  }
  let delay: number = 0;
  switch (rule.backoff) {
    case Backoff.FIXED:
      delay = rule.baseDelayMs;
      break;
    case Backoff.LINEAR:
      delay = rule.baseDelayMs * attempt;
      break;
    case Backoff.EXPONENTIAL:
      delay = rule.baseDelayMs * Math.pow(2, attempt - 1);
      break;
    default:
      return 0;
  }
  if (rule.capMs > 0 && delay > rule.capMs) {
    return rule.capMs;
  }
  return Math.max(0, Math.round(delay));
}

/** 总等待时间：从第 1 次重试累加到上限。 */
export function totalWait(rule: RetryRule): number {
  let total: number = 0;
  for (let attempt = 1; attempt < rule.maxAttempts; attempt++) {
    total += delayOf(rule, attempt);
  }
  return total;
}

/** 单次尝试记录。 */
export class AttemptRecord {
  attempt: number = 0;
  reason: RetryReason = RetryReason.UNKNOWN;
  waitedMs: number = 0;
  succeeded: boolean = false;

  constructor(attempt: number = 0, reason: RetryReason = RetryReason.UNKNOWN,
    waitedMs: number = 0, succeeded: boolean = false) {
    this.attempt = attempt;
    this.reason = reason;
    this.waitedMs = waitedMs;
    this.succeeded = succeeded;
  }

  text(): string {
    return `第 ${this.attempt} 次｜${reasonLabel(this.reason)}｜等待 ${this.waitedMs} ms｜` +
      `${this.succeeded ? '成功' : '失败'}`;
  }
}

/** 重试轨迹。 */
export class RetryTrace {
  records: AttemptRecord[] = [];
  rule: RetryRule = new RetryRule();

  /** 总尝试次数。 */
  attempts(): number {
    return this.records.length;
  }

  /** 总等待。 */
  waited(): number {
    return this.records.reduce((sum: number, item: AttemptRecord): number =>
      sum + Math.max(0, item.waitedMs), 0);
  }

  /** 是否最终成功。 */
  succeeded(): boolean {
    return this.records.length > 0 && this.records[this.records.length - 1].succeeded;
  }

  /** 是否已用尽次数。 */
  exhausted(): boolean {
    return !this.succeeded() && this.attempts() >= this.rule.maxAttempts;
  }

  /** 追加一次尝试。 */
  push(reason: RetryReason, waitedMs: number, succeeded: boolean): void {
    this.records.push(new AttemptRecord(this.records.length + 1, reason, waitedMs, succeeded));
  }

  /** 摘要文本。 */
  text(): string {
    const state: string = this.succeeded() ? '已成功' : (this.exhausted() ? '次数用尽' : '仍可重试');
    return `${this.rule.ruleId}｜${state}｜尝试 ${this.attempts()} 次｜累计等待 ${this.waited()} ms`;
  }

  /** 逐行文本。 */
  lines(): string[] {
    return this.records.map((item: AttemptRecord): string => item.text());
  }
}

/** 按规则模拟一次重试过程：第 failUntil 次之前都失败。 */
export function simulate(rule: RetryRule, failUntil: number): RetryTrace {
  const trace: RetryTrace = new RetryTrace();
  trace.rule = rule;
  const limit: number = Math.max(1, rule.maxAttempts);
  for (let attempt = 1; attempt <= limit; attempt++) {
    const waited: number = attempt === 1 ? 0 : delayOf(rule, attempt - 1);
    const succeeded: boolean = attempt >= failUntil;
    trace.push(rule.reason, waited, succeeded);
    if (succeeded) {
      break;
    }
    if (!rule.retryable()) {
      break;
    }
  }
  return trace;
}

/** 规则自检。 */
export class RetryAudit {
  ok: boolean = false;
  public findings: string[] = [];

  summary(): string {
    return this.ok ? '重试规则表自洽' : this.findings.join('；');
  }
}

/** 校验规则：编号连续、退避与次数一致、上限不小于首次延迟。 */
export function auditRetryRules(): RetryAudit {
  const audit: RetryAudit = new RetryAudit();
  const ids: string[] = ruleIds();
  RETRY_RULES.forEach((rule: RetryRule, index: number): void => {
    const expected: string = `RR-${(index + 1).toString().padStart(2, '0')}`;
    if (rule.ruleId !== expected) {
      audit.findings.push(`编号不连续：期望 ${expected}，实际 ${rule.ruleId}`);
    }
    if (rule.backoff === Backoff.NONE && rule.maxAttempts !== 1) {
      audit.findings.push(`不重试却声明多次尝试：${rule.ruleId}`);
    }
    if (rule.backoff !== Backoff.NONE && rule.baseDelayMs <= 0) {
      audit.findings.push(`可重试但首次延迟为 0：${rule.ruleId}`);
    }
    if (rule.capMs > 0 && rule.capMs < rule.baseDelayMs) {
      audit.findings.push(`延迟上限小于首次延迟：${rule.ruleId}`);
    }
    if (rule.description.length === 0) {
      audit.findings.push(`缺少说明：${rule.ruleId}`);
    }
    if (ids.indexOf(rule.ruleId) < 0) {
      audit.findings.push(`编号缺失：${rule.ruleId}`);
    }
  });
  const reasons: RetryReason[] = [RetryReason.NETWORK, RetryReason.TIMEOUT,
    RetryReason.PERMISSION, RetryReason.VERSION, RetryReason.DEVICE_BUSY,
    RetryReason.STORAGE, RetryReason.PAYLOAD, RetryReason.UNKNOWN];
  reasons.forEach((reason: RetryReason): void => {
    if (rulesOf(reason).length === 0) {
      audit.findings.push(`原因缺少策略：${reasonLabel(reason)}`);
    }
  });
  audit.ok = audit.findings.length === 0;
  return audit;
}

/** 规则摘要行。 */
export function ruleLines(): string[] {
  return RETRY_RULES.map((rule: RetryRule): string => rule.text());
}

/** 原因分布行。 */
export function reasonLines(): string[] {
  const reasons: RetryReason[] = [RetryReason.NETWORK, RetryReason.TIMEOUT,
    RetryReason.PERMISSION, RetryReason.VERSION, RetryReason.DEVICE_BUSY,
    RetryReason.STORAGE, RetryReason.PAYLOAD, RetryReason.UNKNOWN];
  return reasons.map((reason: RetryReason): string => {
    const rules: RetryRule[] = rulesOf(reason);
    const retryable: number = rules.filter((rule: RetryRule): boolean => rule.retryable()).length;
    return `${reasonLabel(reason)}：${rules.length} 条策略，其中可重试 ${retryable} 条`;
  });
}
